#define MINICORO_IMPL
#define MCO_USE_VMEM_ALLOCATOR

#include "runtime.hpp"
#include "../llvm.hpp"

#include <iostream>
#include <memory>
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


Runtime::Impl::Impl(UserConfig conf_, Runtime *parent)
      : parent(parent), raiser(*this), conf(conf_) {
    // Enforce configuration restraints
    if (!conf.unsafe_optimizations) {
        conf.fully_static = false;
        conf.optimizations &= all_safe_optimizations;
    }
    conf.use_cache = conf.use_cache && conf.HasOptimization(OptimizationFlag::BlockLinking);
    conf.fully_static = conf.fully_static && conf.use_cache;

    // Create JIT engine
    CreateJit();
}

void Runtime::Impl::CreateJit() {
    auto expected_jit = llvm::orc::LLJITBuilder()
#ifdef ENABLE_DEBUGGER_SUPPORT
                            .setEnableDebuggerSupport(true)
#endif
                            .create();
    if (!expected_jit) {
        jit = nullptr;
        llvm::errs() << "Failed to initialize JIT: " << expected_jit.takeError() << '\n';
        return;
    }

    jit = std::move(expected_jit.get());
    Lifter::SetupTrampolines(*jit);
}

void Runtime::Impl::UpdateExecutionState() {
    if (halt_reason != HaltReason::None)
        exc.Yield();
}

void Runtime::Impl::ClearCache() {
    if (executing) {
        parent->HaltExecution(HaltReason::CacheInvalidation);
        return;
    }
    cache.Reset();
    exc.Destroy();
    CreateJit();
}

std::uint8_t Runtime::Impl::MemoryRead8(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead8(vaddr);
    self.UpdateExecutionState();
    return fres;
}
std::uint16_t Runtime::Impl::MemoryRead16(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead16(vaddr);
    self.UpdateExecutionState();
    return fres;
}
std::uint32_t Runtime::Impl::MemoryRead32(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead32(vaddr);
    self.UpdateExecutionState();
    return fres;
}
std::uint64_t Runtime::Impl::MemoryRead64(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead64(vaddr);
    self.UpdateExecutionState();
    return fres;
}
Vector Runtime::Impl::MemoryRead128(Runtime::Impl& self, VAddr vaddr) {
    const auto fres = self.conf.callbacks->MemoryRead128(vaddr);
    self.UpdateExecutionState();
    return fres;
}

void Runtime::Impl::MemoryWrite8(Runtime::Impl& self, VAddr vaddr, std::uint8_t value) {
    self.conf.callbacks->MemoryWrite8(vaddr, value);
    self.UpdateExecutionState();
}
void Runtime::Impl::MemoryWrite16(Runtime::Impl& self, VAddr vaddr, std::uint16_t value) {
    self.conf.callbacks->MemoryWrite16(vaddr, value);
    self.UpdateExecutionState();
}
void Runtime::Impl::MemoryWrite32(Runtime::Impl& self, VAddr vaddr, std::uint32_t value) {
    self.conf.callbacks->MemoryWrite32(vaddr, value);
    self.UpdateExecutionState();
}
void Runtime::Impl::MemoryWrite64(Runtime::Impl& self, VAddr vaddr, std::uint64_t value) {
    self.conf.callbacks->MemoryWrite64(vaddr, value);
    self.UpdateExecutionState();
}
void Runtime::Impl::MemoryWrite128(Runtime::Impl& self, VAddr vaddr, Vector value) {
    self.conf.callbacks->MemoryWrite128(vaddr, value);
    self.UpdateExecutionState();
}


Runtime::Runtime(UserConfig conf)
    : impl(new Impl(conf, this)) {}

Runtime::~Runtime() {
    delete impl;
}

HaltReason Runtime::Run() {
    impl->executing = true;
    impl->halt_reason = HaltReason::None;

    auto expected_addr = impl->raiser.Lift(impl->PC);
    if (!expected_addr) {
        impl->conf.callbacks->ExceptionRaised(impl->PC, Exception::UnpredictableInstruction); //TODO: Raise proper exception?
        return HaltReason::MemoryAbort;
    }

    if (!impl->exc.Exists())
        impl->exc.Create(expected_addr.value() /*TODO: Handle error*/);
    impl->exc.Resume();

    impl->executing = false;

    if (Has(impl->halt_reason, HaltReason::CacheInvalidation))
        impl->ClearCache();

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

void Runtime::HaltExecution(HaltReason hr) {
    impl->halt_reason |= hr;
}

void Runtime::ClearHalt(HaltReason hr) {
    impl->halt_reason &= ~hr;
}

std::uint64_t Runtime::GetSP() const {
    return impl->SP;
}
void Runtime::SetSP(std::uint64_t value) {
    impl->SP = value;
}

std::uint64_t Runtime::GetPC() const {
    return impl->PC;
}
void Runtime::SetPC(std::uint64_t value) {
    DYNAUTIC_ASSERT(!impl->executing);
    impl->exc.Destroy();
    impl->PC = value;
}

std::uint64_t Runtime::GetRegister(std::size_t index) const {
    return impl->registers.at(index);
}
void Runtime::SetRegister(size_t index, std::uint64_t value) {
    impl->registers.at(index) = value;
}

std::array<std::uint64_t, 31> Runtime::GetRegisters() const {
    return impl->registers;
}
void Runtime::SetRegisters(const std::array<std::uint64_t, 31>& value) {
    impl->registers = value;
}

Vector Runtime::GetVector(std::size_t index) const {
    return impl->vectors.at(index);
}
void Runtime::SetVector(std::size_t index, Vector value) {
    impl->vectors.at(index) = value;
}

std::array<Vector, 32> Runtime::GetVectors() const {
    return impl->vectors;
}
void Runtime::SetVectors(const std::array<Vector, 32>& value) {
    impl->vectors = value;
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

void Runtime::ClearExclusiveState() {
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
