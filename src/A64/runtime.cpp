#define MINICORO_IMPL
#define MCO_USE_VMEM_ALLOCATOR

#include "runtime.hpp"
#include "../llvm.hpp"

#include <iostream>
#include <memory>
#include <array>
#include <dynautic/A64.hpp>
#include <llvm/ExecutionEngine/Orc/TargetProcess/RegisterEHFrames.h>



namespace Dynautic::A64 {
void ExecutionContext::Create(const llvm::orc::ExecutorAddr& entry) {
    struct Data {
        ExecutionContext *self;
        llvm::orc::ExecutorAddr entry;
    };
    auto data = new Data{this, entry};

    // Delete old coroutine
    if (coro)
        mco_destroy(coro);

    // Create new coroutine
    mco_desc desc = mco_desc_init([] (mco_coro* co) {
        auto data_ptr = reinterpret_cast<Data *>(co->user_data);
        const auto data = *data_ptr;
        delete data_ptr;
        data.self->Yield();
        data.self->Call(data.entry);
    }, 0);
    desc.user_data = reinterpret_cast<void *>(data);
    mco_create(&coro, &desc);
    Resume(); // Despite clang-analyzer complaining, no memory will leak here
}
void ExecutionContext::Destroy() {
    if (coro) {
        mco_destroy(coro);
        coro = nullptr;
    }
}

void ExecutionContext::Call(const llvm::orc::ExecutorAddr &execution_addr) {
    execution_addr.toPtr<void(void)>()();
}


class LLVMInitSingleton {
    std::unique_ptr<llvm::InitLLVM> init;

public:
    LLVMInitSingleton() {
        static int fake_argc = 1;
        static char fake_argv0[9] = "dynautic";
        static char *fake_argv[2] = {fake_argv0, nullptr};
        static char **fake_argv_ptr = fake_argv;
        init = std::make_unique<llvm::InitLLVM>(fake_argc, fake_argv_ptr);
        llvm::InitializeNativeTarget();
        llvm::InitializeNativeTargetAsmPrinter();
    }
} g_LLVMInitSingleton;

Runtime::Impl::Impl(UserConfig conf_, Runtime *parent) : parent(parent), lifter(*this), conf(conf_) {
    // Enforce configuration restraints
    if (!conf.unsafe_optimizations) {
        conf.fully_static = false;
        conf.optimizations &= all_safe_optimizations;
    }
    conf.use_cache = conf.use_cache && conf.HasOptimization(OptimizationFlag::BlockLinking);
    conf.fully_static = conf.fully_static && conf.use_cache;
    conf.update_cache = conf.update_cache && !conf.fully_static;
    if (!(conf.update_cache && conf.use_cache))
        conf.periodic_recompile = 0;

    // Create global monitor if not ignored
    if (!conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
        GlobalMonitor::Create(conf.system_id, conf.native_memory);
        monitor = &GlobalMonitor::Get(conf.system_id);
    }

    // Create JIT engine
    CreateJit();
}

void Runtime::Impl::CreateJit() {
    auto expected_jit = llvm::orc::LLJITBuilder().create();
    if (!expected_jit) {
        jit = nullptr;
        llvm::errs() << "Failed to initialize JIT: " << expected_jit.takeError() << '\n';
        return;
    }

    jit = std::move(expected_jit.get());
    Lifter::SetupTrampolines(*jit);

    CreateGlobals();
}

void Runtime::Impl::CreateGlobals() {
    using namespace llvm;

    // Create globals module
    std::unique_ptr<LLVMContext> context = std::make_unique<LLVMContext>();
    std::unique_ptr<Module> module = std::make_unique<Module>("Globals", *context);

    // Create globals
    auto CreateGlobal = [&] (Type *type, llvm::StringRef name) {
        module->getOrInsertGlobal(name, type);
        GlobalVariable *global = module->getNamedGlobal(name);
        global->setLinkage(GlobalValue::ExternalLinkage);
        global->setInitializer(Constant::getNullValue(type));
        global->setConstant(false);
    };
    CreateGlobal(Type::getInt64Ty(*context), "stack_pointer");
    for (unsigned idx = 0; idx != 31; idx++)
        CreateGlobal(Type::getInt64Ty(*context), "general_register_"+std::to_string(idx));
    for (unsigned idx = 0; idx != 32; idx++)
        CreateGlobal(Type::getInt128Ty(*context), "vector_register_"+std::to_string(idx));
    CreateGlobal(Type::getInt64Ty(*context), "comparison_first");
    CreateGlobal(Type::getInt64Ty(*context), "comparison_second");
    CreateGlobal(Type::getInt8Ty(*context), "nzcv");

    // Dump generated IR if enabled
    if (conf.dump_assembly)
        outs() << *module;

    // Add module to JIT
    auto error = jit->addIRModule(orc::ThreadSafeModule(std::move(module), std::move(context)));
    if (error) {
        errs() << "Failed to add globals module: " << error << '\n';
        jit = nullptr;
    }
}

StateDump Runtime::Impl::DumpState() {
    StateDump fres;

    fres.GetProgramCounter() = pc;

    if (auto expected_address = jit->lookup("stack_pointer"))
        fres.GetStackPointer() = *reinterpret_cast<uint64_t *>(expected_address->getValue());

    for (unsigned idx = 0; idx != 31; idx++)
        if (auto expected_address = jit->lookup("general_register_" + std::to_string(idx)))
            fres.GetGeneralRegs()[idx] = *reinterpret_cast<std::uint64_t *>(expected_address->getValue());

    for (unsigned idx = 0; idx != 32; idx++)
        if (auto expected_address = jit->lookup("vector_register_" + std::to_string(idx)))
            fres.GetVectorRegs()[idx] = *reinterpret_cast<Vector *>(expected_address->getValue());

    if (auto expected_address = jit->lookup("comparison_first"))
        fres.GetComparison()[0] = *reinterpret_cast<uint64_t *>(expected_address->getValue());
    if (auto expected_address = jit->lookup("comparison_second"))
        fres.GetComparison()[1] = *reinterpret_cast<uint64_t *>(expected_address->getValue());
    if (auto expected_address = jit->lookup("nzcv"))
        fres.GetNZCV() = *reinterpret_cast<uint8_t *>(expected_address->getValue());

    return fres;
}

void Runtime::Impl::RestoreState(const StateDump& dump) {
    const auto newPc = dump.GetProgramCounter();
    if (newPc != pc) {
        exc.Destroy();
        pc = newPc;
    }

    if (auto expected_address = jit->lookup("stack_pointer"))
        *reinterpret_cast<uint64_t *>(expected_address->getValue()) = dump.GetStackPointer();

    for (unsigned idx = 0; idx != 31; idx++)
        if (auto expected_address = jit->lookup("general_register_" + std::to_string(idx)))
            *reinterpret_cast<std::uint64_t *>(expected_address->getValue()) = dump.GetGeneralRegs()[idx];

    for (unsigned idx = 0; idx != 32; idx++)
        if (auto expected_address = jit->lookup("vector_register_" + std::to_string(idx)))
            *reinterpret_cast<Vector *>(expected_address->getValue()) = dump.GetVectorRegs()[idx];

    if (auto expected_address = jit->lookup("comparison_first"))
        *reinterpret_cast<uint64_t *>(expected_address->getValue()) = dump.GetComparison()[0];
    if (auto expected_address = jit->lookup("comparison_second"))
        *reinterpret_cast<uint64_t *>(expected_address->getValue()) = dump.GetComparison()[1];
    if (auto expected_address = jit->lookup("nzcv"))
        *reinterpret_cast<uint8_t *>(expected_address->getValue()) = dump.GetNZCV();
}

void Runtime::Impl::CheckHalt() {
    if (halt_reason != HaltReason::None)
        exc.Yield();
}

void Runtime::Impl::ClearCache() {
    if (executing) {
        parent->HaltExecution(HaltReason::CacheInvalidation);
        return;
    }
    cache.Reset();
    ClearJIT();
}

void Runtime::Impl::ClearJIT() {
    if (executing) {
        parent->HaltExecution(HaltReason::JITInvalidation);
        return;
    }
    const auto state = DumpState();
    exc.Destroy();
    lifter.Reset();
    CreateJit();
    RestoreState(state);
}

std::uint8_t Runtime::Impl::MemoryRead8(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead8(vaddr);
    self.CheckHalt();
    return fres;
}
std::uint16_t Runtime::Impl::MemoryRead16(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead16(vaddr);
    self.CheckHalt();
    return fres;
}
std::uint32_t Runtime::Impl::MemoryRead32(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead32(vaddr);
    self.CheckHalt();
    return fres;
}
std::uint64_t Runtime::Impl::MemoryRead64(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead64(vaddr);
    self.CheckHalt();
    return fres;
}
Vector Runtime::Impl::MemoryRead128(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead128(vaddr);
    self.CheckHalt();
    return fres;
}

void Runtime::Impl::MemoryWrite8(Runtime::Impl& self, VAddr vaddr, std::uint8_t value) {
    self.conf.callbacks->MemoryWrite8(vaddr, value);
    self.CheckHalt();
}
void Runtime::Impl::MemoryWrite16(Runtime::Impl& self, VAddr vaddr, std::uint16_t value) {
    self.conf.callbacks->MemoryWrite16(vaddr, value);
    self.CheckHalt();
}
void Runtime::Impl::MemoryWrite32(Runtime::Impl& self, VAddr vaddr, std::uint32_t value) {
    self.conf.callbacks->MemoryWrite32(vaddr, value);
    self.CheckHalt();
}
void Runtime::Impl::MemoryWrite64(Runtime::Impl& self, VAddr vaddr, std::uint64_t value) {
    self.conf.callbacks->MemoryWrite64(vaddr, value);
    self.CheckHalt();
}
void Runtime::Impl::MemoryWrite128(Runtime::Impl& self, VAddr vaddr, Vector value) {
    self.conf.callbacks->MemoryWrite128(vaddr, value);
    self.CheckHalt();
}


Runtime::Runtime(UserConfig conf)
    : impl(new Impl(conf, this)) {}

Runtime::~Runtime() {
    delete impl;
}

HaltReason Runtime::Run() {
    impl->executing = true;
    impl->halt_reason = HaltReason::None;

    auto expected_addr = impl->lifter.Lift(impl->pc);
    if (!expected_addr) {
        impl->conf.callbacks->ExceptionRaised(impl->pc, Exception::UnpredictableInstruction); //TODO: Raise proper exception?
        return HaltReason::MemoryAbort;
    }

    if (!impl->exc.Exists())
        impl->exc.Create(expected_addr.value() /*TODO: Handle error*/);
    impl->exc.Resume();

    impl->executing = false;

    if (Has(impl->halt_reason, HaltReason::CacheInvalidation))
        impl->ClearCache();
    if (Has(impl->halt_reason, HaltReason::JITInvalidation))
        impl->ClearJIT();

    return impl->halt_reason;
}
HaltReason Runtime::Step() {
    impl->executing = true;
    //
    impl->executing = false;
    return HaltReason::Step;
}

void Runtime::Reset() {
    delete impl;
    impl = new Impl(impl->conf, this);
}

void Runtime::ClearCache() {
    impl->ClearCache();
}

void Runtime::ClearJIT() { impl->ClearJIT(); }

void Runtime::HaltExecution(HaltReason hr) { impl->halt_reason |= hr; }

void Runtime::ClearHalt(HaltReason hr) {
    impl->halt_reason &= ~hr;
}

StateDump Runtime::DumpState() { return impl->DumpState(); }

void Runtime::RestoreState(const StateDump& dump) { impl->RestoreState(dump); }

std::uint64_t Runtime::GetSP() const {
    if (auto expected_address = impl->jit->lookup("stack_pointer"))
        return *reinterpret_cast<const std::uint64_t*>(expected_address->getValue());
    return 0xbad0cac;
}
void Runtime::SetSP(std::uint64_t value) {
    if (auto expected_address = impl->jit->lookup("stack_pointer"))
        *reinterpret_cast<std::uint64_t*>(expected_address->getValue()) = value;
}

std::uint64_t Runtime::GetPC() const {
    return impl->pc;
}
void Runtime::SetPC(std::uint64_t value) {
    DYNAUTIC_ASSERT(!impl->executing);
    impl->exc.Destroy();
    impl->pc = value;
}

std::uint64_t Runtime::GetRegister(std::size_t index) const {
    if (auto expected_address = impl->jit->lookup("general_register_"+std::to_string(index)))
        return *reinterpret_cast<const std::uint64_t*>(expected_address->getValue());
    return 0xbad0cac;
}
void Runtime::SetRegister(size_t index, std::uint64_t value) {
    if (auto expected_address = impl->jit->lookup("general_register_"+std::to_string(index)))
        *reinterpret_cast<std::uint64_t*>(expected_address->getValue()) = value;
}

std::array<std::uint64_t, 31> Runtime::GetRegisters() const {
    std::array<std::uint64_t, 31> fres;
    for (unsigned idx = 0; idx != fres.size(); ++idx)
        fres[idx] = GetRegister(idx);
    return fres;
}
void Runtime::SetRegisters(const std::array<std::uint64_t, 31>& values) {
    for (unsigned idx = 0; idx != values.size(); ++idx)
        SetRegister(idx, values[idx]);
}

Vector Runtime::GetVector(std::size_t index) const {
    if (auto expected_address = impl->jit->lookup("vector_register_"+std::to_string(index)))
        return *reinterpret_cast<const Vector*>(expected_address->getValue());
}
void Runtime::SetVector(std::size_t index, Vector value) {
    if (auto expected_address = impl->jit->lookup("vector_register_"+std::to_string(index)))
        *reinterpret_cast<Vector*>(expected_address->getValue()) = value;
}

std::array<Vector, 32> Runtime::GetVectors() const {
    std::array<Vector, 32> fres;
    for (unsigned idx = 0; idx != fres.size(); ++idx)
        fres[idx] = GetVector(idx);
    return fres;
}
void Runtime::SetVectors(const std::array<Vector, 32>& values) {
    for (unsigned idx = 0; idx != values.size(); ++idx)
        SetVector(idx, values[idx]);
}

std::uint32_t Runtime::GetFpcr() const {
    //
}
void Runtime::SetFpcr(std::uint32_t value) {
    //
}

std::uint32_t Runtime::GetFpsr() const {
    //
}
void Runtime::SetFpsr(std::uint32_t value) {
    //
}

std::uint32_t Runtime::GetPstate() const {
    //
}
void Runtime::SetPstate(std::uint32_t value) {
    //
}

std::vector<uint64_t> Runtime::DumpCache() const {
    return impl->cache.Dump();
}

void Runtime::LoadCache(const std::vector<uint64_t>& data) {
    impl->cache.Load(data);
}

bool Runtime::IsExecuting() const {
    return impl->executing;
}

std::vector<std::string> Runtime::Disassemble() const {
    //
}
}
