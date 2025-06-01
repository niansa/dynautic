#include "../globalmonitor.hpp"
#include "../llvm.hpp"
#include "lifter.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"

#include <iostream>
#include <llvm/Passes/OptimizationLevel.h>
#include <llvm/Passes/PassBuilder.h>
#include <thread>

namespace Dynautic::A64 {
namespace {
void LiftTrampoline(Lifter& self, VAddr addr) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: Calling function at " << std::hex << addr << " via trampoline" << std::dec << std::endl;
#endif
    self.rt.CheckHalt();
    // This is the wrong signature, but still valid (hopefully). It's needed to
    // enforce tail call optimization
    using Function = decltype(LiftTrampoline);
    Function *fnc;
    {
        auto executor_address = self.Lift(addr);
        DYNAUTIC_ASSERT(executor_address.has_value());
        fnc = executor_address->toPtr<Function>();
    }
#ifdef __clang__
    __attribute__((musttail))
#else
#warning "GCC does not support musttail, LiftTrampoline stack overhead may be increased"
#endif
    return fnc(self, addr);
}

void SvcTrampoline(Runtime::Impl& rt, uint32_t swi) {
    rt.CheckHalt();
    rt.conf.callbacks->CallSVC(swi);
    rt.CheckHalt();
}

void ExceptionTrampoline(Runtime::Impl& rt, VAddr pc, uint32_t exception) {
    rt.CheckHalt();
    rt.conf.callbacks->ExceptionRaised(pc, static_cast<Exception>(exception));
    rt.CheckHalt();
}

void CheckHaltTrampoline(Runtime::Impl& rt) { rt.CheckHalt(); }

void ResetJITForPeriodicRecompileTrampoline(Runtime::Impl& rt) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Considering JIT reset after " << rt.lastCompile.get() << " ms..." << std::endl;
#endif
    if (rt.conf.periodic_recompile && rt.lastCompile.get() > rt.conf.periodic_recompile) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
        std::cout << "Resetting JIT for periodic recompile." << std::endl;
#endif
        rt.parent->HaltExecution(HaltReason::JITInvalidation);
        rt.exc.Yield();
    }
}

void CreateDynamicBranchEntryTrampoline(Cache& cache, VAddr origin, VAddr target) { cache.CreateDynamicBranchEntry(origin, target); }

void FreezeTrampoline(Runtime::Impl& rt) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Freezing execution." << std::endl;
#endif
    while (true) {
        std::this_thread::yield();
        rt.CheckHalt();
    }
}

void ExclusiveMonitorTagTrampoline(Runtime::Impl& rt, VAddr address) {
    DYNAUTIC_ASSERT(rt.monitor);
    rt.monitor->Tag(address, rt.conf.processor_id);
}
void ExclusiveMonitorUntagTrampoline(Runtime::Impl& rt, VAddr address) {
    DYNAUTIC_ASSERT(rt.monitor);
    rt.monitor->Untag(address, rt.conf.processor_id);
}
void ExclusiveMonitorPoisonTrampoline(Runtime::Impl& rt, VAddr address) {
    DYNAUTIC_ASSERT(rt.monitor);
    rt.monitor->Poison(address);
}
bool ExclusiveMonitorIsPoisonedTrampoline(Runtime::Impl& rt, VAddr address) {
    DYNAUTIC_ASSERT(rt.monitor);
    return rt.monitor->IsPoisoned(address, rt.conf.processor_id);
}

#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
void DebugPrintTrampoline(const char *message, VAddr addr) {
    std::cout << "Runtime debug message: " << message << " at ";
    if (addr != 0xbad0bad0bad0bad0)
        std::cout << "0x" << std::hex << addr << std::dec << '\n';
    else
        std::cout << "function entry\n";
}
#endif

uint8_t MemoryRead8(Runtime::Impl& rt, VAddr addr) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 8 bits of data read from 0x" << std::hex << addr << std::dec << std::endl;
#endif
    return rt.conf.callbacks->MemoryRead8(addr);
}
uint16_t MemoryRead16(Runtime::Impl& rt, VAddr addr) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 16 bits of data read from 0x" << std::hex << addr << std::dec << std::endl;
#endif
    return rt.conf.callbacks->MemoryRead16(addr);
}
uint32_t MemoryRead32(Runtime::Impl& rt, VAddr addr) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 32 bits of data read from 0x" << std::hex << addr << std::dec << std::endl;
#endif
    return rt.conf.callbacks->MemoryRead32(addr);
}
uint64_t MemoryRead64(Runtime::Impl& rt, VAddr addr) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 64 bits of data read from 0x" << std::hex << addr << std::dec << std::endl;
#endif
    return rt.conf.callbacks->MemoryRead64(addr);
}
Vector MemoryRead128(Runtime::Impl& rt, VAddr addr) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 128 bits of data read from 0x" << std::hex << addr << std::dec << std::endl;
#endif
    return rt.conf.callbacks->MemoryRead128(addr);
}

void MemoryWrite8(Runtime::Impl& rt, VAddr addr, uint8_t value) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 8 bits of data written to 0x" << std::hex << addr << std::dec << std::endl;
#endif
    rt.conf.callbacks->MemoryWrite8(addr, value);
}
void MemoryWrite16(Runtime::Impl& rt, VAddr addr, uint16_t value) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 16 bits of data written to 0x" << std::hex << addr << std::dec << std::endl;
#endif
    rt.conf.callbacks->MemoryWrite16(addr, value);
}
void MemoryWrite32(Runtime::Impl& rt, VAddr addr, uint32_t value) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 32 bits of data written to 0x" << std::hex << addr << std::dec << std::endl;
#endif
    rt.conf.callbacks->MemoryWrite32(addr, value);
}
void MemoryWrite64(Runtime::Impl& rt, VAddr addr, uint64_t value) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 64 bits of data written to 0x" << std::hex << addr << std::dec << std::endl;
#endif
    rt.conf.callbacks->MemoryWrite64(addr, value);
}
void MemoryWrite128(Runtime::Impl& rt, VAddr addr, Vector value) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    std::cout << "Runtime debug message: 128 bits of data written to 0x" << std::hex << addr << std::dec << std::endl;
#endif
    rt.conf.callbacks->MemoryWrite128(addr, value);
}
} // namespace

void Lifter::SetupTrampolines(llvm::orc::LLJIT& jit) {
    [[maybe_unused]]
    auto error = jit.getMainJITDylib().define(absoluteSymbols(llvm::orc::SymbolMap(
        {{jit.mangleAndIntern("MemoryRead8"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryRead8), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryRead16"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryRead16), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryRead32"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryRead32), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryRead64"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryRead64), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryRead128"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryRead128), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryWrite8"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryWrite8), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryWrite16"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryWrite16), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryWrite32"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryWrite32), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryWrite64"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryWrite64), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("MemoryWrite128"), {llvm::orc::ExecutorAddr::fromPtr(&MemoryWrite128), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("LiftTrampoline"), {llvm::orc::ExecutorAddr::fromPtr(&LiftTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("SvcTrampoline"), {llvm::orc::ExecutorAddr::fromPtr(&SvcTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("ExceptionTrampoline"), {llvm::orc::ExecutorAddr::fromPtr(&ExceptionTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("CheckHaltTrampoline"), {llvm::orc::ExecutorAddr::fromPtr(&CheckHaltTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("ResetJITForPeriodicRecompileTrampoline"),
          {llvm::orc::ExecutorAddr::fromPtr(&ResetJITForPeriodicRecompileTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("CreateDynamicBranchEntryTrampoline"),
          {llvm::orc::ExecutorAddr::fromPtr(&CreateDynamicBranchEntryTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("FreezeTrampoline"), {llvm::orc::ExecutorAddr::fromPtr(&FreezeTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("ExclusiveMonitorTagTrampoline"),
          {llvm::orc::ExecutorAddr::fromPtr(&ExclusiveMonitorTagTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("ExclusiveMonitorUntagTrampoline"),
          {llvm::orc::ExecutorAddr::fromPtr(&ExclusiveMonitorUntagTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("ExclusiveMonitorPoisonTrampoline"),
          {llvm::orc::ExecutorAddr::fromPtr(&ExclusiveMonitorPoisonTrampoline), llvm::JITSymbolFlags::Callable}},
         {jit.mangleAndIntern("ExclusiveMonitorIsPoisonedTrampoline"),
          {llvm::orc::ExecutorAddr::fromPtr(&ExclusiveMonitorIsPoisonedTrampoline), llvm::JITSymbolFlags::Callable}},
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
         {jit.mangleAndIntern("DebugPrintTrampoline"), {llvm::orc::ExecutorAddr::fromPtr(&DebugPrintTrampoline), llvm::JITSymbolFlags::Callable}}
#endif
        })));
    DYNAUTIC_ASSERT(!error);
}

llvm::FunctionCallee Lifter::GetMemoryRead(Instance& rinst, uint8_t bits) {
    switch (bits) {
    case 8: {
        const auto ftype = llvm::FunctionType::get(rinst.GetIntType(8), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
        return rinst.module->getOrInsertFunction("MemoryRead8", ftype);
    }
    case 16: {
        const auto ftype = llvm::FunctionType::get(rinst.GetIntType(16), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
        return rinst.module->getOrInsertFunction("MemoryRead16", ftype);
    }
    case 32: {
        const auto ftype = llvm::FunctionType::get(rinst.GetIntType(32), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
        return rinst.module->getOrInsertFunction("MemoryRead32", ftype);
    }
    case 64: {
        const auto ftype = llvm::FunctionType::get(rinst.GetIntType(64), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
        return rinst.module->getOrInsertFunction("MemoryRead64", ftype);
    }
    case 128: {
        const auto ftype = llvm::FunctionType::get(rinst.GetIntType(128), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
        return rinst.module->getOrInsertFunction("MemoryRead128", ftype);
    }
    default:
        DYNAUTIC_ASSERT(!"Invalid memory read width (bits != {8, 16, 32, 64, 128})");
    }
    abort();
}

llvm::FunctionCallee Lifter::GetMemoryWrite(Instance& rinst, uint8_t bits) {
    switch (bits) {
    case 8: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64), rinst.GetIntType(8)}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite8", ftype);
    }
    case 16: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64), rinst.GetIntType(16)}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite16", ftype);
    }
    case 32: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64), rinst.GetIntType(32)}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite32", ftype);
    }
    case 64: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64), rinst.GetIntType(64)}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite64", ftype);
    }
    case 128: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64), rinst.GetIntType(128)}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite128", ftype);
    }
    default:
        DYNAUTIC_ASSERT(!"Invalid memory write width (bits != {8, 16, 32, 64, 128})");
    }
    abort();
}

llvm::FunctionCallee Lifter::GetLiftTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
    return rinst.module->getOrInsertFunction("LiftTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetSvcTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(32)}, false);
    return rinst.module->getOrInsertFunction("SvcTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetExceptionTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64), rinst.GetIntType(32)}, false);
    return rinst.module->getOrInsertFunction("ExceptionTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetCheckHaltTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy()}, false);
    return rinst.module->getOrInsertFunction("CheckHaltTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetResetJITForPeriodicRecompileTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy()}, false);
    return rinst.module->getOrInsertFunction("ResetJITForPeriodicRecompileTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetCreateDynamicBranchEntryTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64), rinst.GetIntType(64)}, false);
    return rinst.module->getOrInsertFunction("CreateDynamicBranchEntryTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetFreezeTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy()}, false);
    return rinst.module->getOrInsertFunction("FreezeTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetExclusiveMonitorTagTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
    return rinst.module->getOrInsertFunction("ExclusiveMonitorTagTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetExclusiveMonitorUntagTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
    return rinst.module->getOrInsertFunction("ExclusiveMonitorUntagTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetExclusiveMonitorPoisonTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
    return rinst.module->getOrInsertFunction("ExclusiveMonitorPoisonTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetExclusiveMonitorIsPoisonedTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.GetIntType(8), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
    return rinst.module->getOrInsertFunction("ExclusiveMonitorIsPoisonedTrampoline", ftype);
}

#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
llvm::FunctionCallee Lifter::GetDebugPrintTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.GetIntType(64)}, false);
    return rinst.module->getOrInsertFunction("DebugPrintTrampoline", ftype);
}

#endif
void Lifter::OptimizeModule(llvm::Module& module) {
    using namespace llvm;

    // Get optimization level
    OptimizationLevel level;
    switch (rt.conf.llvm_opt_level) {
    case LLVMOptimizationLevel::O0:
        level = OptimizationLevel::O0;
        break;
    case LLVMOptimizationLevel::O1:
        level = OptimizationLevel::O1;
        break;
    case LLVMOptimizationLevel::O2:
        level = OptimizationLevel::O2;
        break;
    case LLVMOptimizationLevel::O3:
        level = OptimizationLevel::O3;
        break;
    case LLVMOptimizationLevel::Os:
        level = OptimizationLevel::Os;
        break;
    case LLVMOptimizationLevel::Oz:
        level = OptimizationLevel::Oz;
        break;
    }

    // Optimize module
    LoopAnalysisManager la_manager;
    FunctionAnalysisManager fa_manager;
    CGSCCAnalysisManager cga_manager;
    ModuleAnalysisManager ma_manager;
    PassBuilder pass_builder;
    pass_builder.registerModuleAnalyses(ma_manager);
    pass_builder.registerCGSCCAnalyses(cga_manager);
    pass_builder.registerFunctionAnalyses(fa_manager);
    pass_builder.registerLoopAnalyses(la_manager);
    pass_builder.crossRegisterProxies(la_manager, fa_manager, cga_manager, ma_manager);
    ModulePassManager mp_manager;
    mp_manager.addPass(pass_builder.buildPerModuleDefaultPipeline(level));
    mp_manager.run(module, ma_manager);
}
} // namespace Dynautic::A64
