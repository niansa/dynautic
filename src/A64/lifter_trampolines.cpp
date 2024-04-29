#include "lifter.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "../llvm.hpp"

#include <thread>



namespace Dynautic::A64 {
namespace {
void LiftTrampoline(Lifter& self, VAddr addr) {
    self.rt.UpdateExecutionState();
    // This is the wrong signature, but still valid (hopefully). It's needed to enforce tail call optimization
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
#   warning "GCC does not support musttail, LiftTrampoline stack overhead may be increased"
#endif
    return fnc(self, addr);
}

void SvcTrampoline(Runtime::Impl& rt, uint32_t swi) {
    rt.UpdateExecutionState();
    rt.conf.callbacks->CallSVC(swi);
    rt.UpdateExecutionState();
}

void ExceptionTrampoline(Runtime::Impl& rt, VAddr pc, uint32_t exception) {
    rt.UpdateExecutionState();
    rt.conf.callbacks->ExceptionRaised(pc, static_cast<Exception>(exception));
    rt.UpdateExecutionState();
}

void UpdateExecutionStateTrampoline(Runtime::Impl& rt) {
    rt.UpdateExecutionState();
}

void CreateDynamicBranchEntryTrampoline(Cache& cache, VAddr origin, VAddr target) {
    cache.CreateDynamicBranchEntry(origin, target);
}

void FreezeTrampoline(Runtime::Impl& rt) {
    while (true) {
        std::this_thread::yield();
        rt.UpdateExecutionState();
    }
}

uint8_t MemoryRead8(Runtime::Impl& rt, VAddr addr) {
    return rt.conf.callbacks->MemoryRead8(addr);
}
uint16_t MemoryRead16(Runtime::Impl& rt, VAddr addr) {
    return rt.conf.callbacks->MemoryRead16(addr);
}
uint32_t MemoryRead32(Runtime::Impl& rt, VAddr addr) {
    return rt.conf.callbacks->MemoryRead32(addr);
}
uint64_t MemoryRead64(Runtime::Impl& rt, VAddr addr) {
    return rt.conf.callbacks->MemoryRead64(addr);
}
Vector MemoryRead128(Runtime::Impl& rt, VAddr addr) {
    return rt.conf.callbacks->MemoryRead128(addr);
}

void MemoryWrite8(Runtime::Impl& rt, VAddr addr, uint8_t value) {
    rt.conf.callbacks->MemoryWrite8(addr, value);
}
void MemoryWrite16(Runtime::Impl& rt, VAddr addr, uint16_t value) {
    rt.conf.callbacks->MemoryWrite16(addr, value);
}
void MemoryWrite32(Runtime::Impl& rt, VAddr addr, uint32_t value) {
    rt.conf.callbacks->MemoryWrite32(addr, value);
}
void MemoryWrite64(Runtime::Impl& rt, VAddr addr, uint64_t value) {
    rt.conf.callbacks->MemoryWrite64(addr, value);
}
void MemoryWrite128(Runtime::Impl& rt, VAddr addr, Vector value) {
    rt.conf.callbacks->MemoryWrite128(addr, value);
}
}

void Lifter::SetupTrampolines(llvm::orc::LLJIT& jit) {
    [[maybe_unused]] auto error = jit.getMainJITDylib().define(absoluteSymbols(llvm::orc::SymbolMap({
        { jit.mangleAndIntern("MemoryRead8"),
         { llvm::pointerToJITTargetAddress(&MemoryRead8),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryRead16"),
         { llvm::pointerToJITTargetAddress(&MemoryRead16),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryRead32"),
         { llvm::pointerToJITTargetAddress(&MemoryRead32),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryRead64"),
         { llvm::pointerToJITTargetAddress(&MemoryRead64),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryRead128"),
         { llvm::pointerToJITTargetAddress(&MemoryRead128),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryWrite8"),
         { llvm::pointerToJITTargetAddress(&MemoryWrite8),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryWrite16"),
         { llvm::pointerToJITTargetAddress(&MemoryWrite16),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryWrite32"),
         { llvm::pointerToJITTargetAddress(&MemoryWrite32),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryWrite64"),
         { llvm::pointerToJITTargetAddress(&MemoryWrite64),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("MemoryWrite128"),
         { llvm::pointerToJITTargetAddress(&MemoryWrite128),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("LiftTrampoline"),
         { llvm::pointerToJITTargetAddress(&LiftTrampoline),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("SvcTrampoline"),
         { llvm::pointerToJITTargetAddress(&SvcTrampoline),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("ExceptionTrampoline"),
         { llvm::pointerToJITTargetAddress(&ExceptionTrampoline),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("UpdateExecutionStateTrampoline"),
         { llvm::pointerToJITTargetAddress(&UpdateExecutionStateTrampoline),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("CreateDynamicBranchEntryTrampoline"),
         { llvm::pointerToJITTargetAddress(&CreateDynamicBranchEntryTrampoline),
          llvm::JITSymbolFlags::Callable } },
        { jit.mangleAndIntern("FreezeTrampoline"),
         { llvm::pointerToJITTargetAddress(&FreezeTrampoline),
          llvm::JITSymbolFlags::Callable } }
    })));
    DYNAUTIC_ASSERT(!error);
}


llvm::FunctionCallee Lifter::GetMemoryRead(Instance& rinst, uint8_t bits) {
    switch (bits) {
    case 8: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getInt8Ty(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryRead8", ftype);
    }
    case 16: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getInt16Ty(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryRead16", ftype);
    }
    case 32: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getInt32Ty(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryRead32", ftype);
    }
    case 64: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getInt64Ty(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryRead64", ftype);
    }
    case 128: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getInt128Ty(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryRead128", ftype);
    }
    default: DYNAUTIC_ASSERT(!"Invalid memory read width (bits != {8, 16, 32, 64, 128})");
    }
}

llvm::FunctionCallee Lifter::GetMemoryWrite(Instance& rinst, uint8_t bits) {
    switch (bits) {
    case 8: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty(), rinst.builder->getInt8Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite8", ftype);
    }
    case 16: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty(), rinst.builder->getInt16Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite16", ftype);
    }
    case 32: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty(), rinst.builder->getInt32Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite32", ftype);
    }
    case 64: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty(), rinst.builder->getInt64Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite64", ftype);
    }
    case 128: {
        const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty(), rinst.builder->getInt128Ty()}, false);
        return rinst.module->getOrInsertFunction("MemoryWrite128", ftype);
    }
    default: DYNAUTIC_ASSERT(!"Invalid memory write width (bits != {8, 16, 32, 64, 128})");
    }
}

llvm::FunctionCallee Lifter::GetLiftTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty()}, false);
    return rinst.module->getOrInsertFunction("LiftTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetSvcTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt32Ty()}, false);
    return rinst.module->getOrInsertFunction("SvcTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetExceptionTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty(), rinst.builder->getInt32Ty()}, false);
    return rinst.module->getOrInsertFunction("ExceptionTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetUpdateExecutionStateTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy()}, false);
    return rinst.module->getOrInsertFunction("UpdateExecutionStateTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetCreateDynamicBranchEntryTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy(), rinst.builder->getInt64Ty(), rinst.builder->getInt64Ty()}, false);
    return rinst.module->getOrInsertFunction("CreateDynamicBranchEntryTrampoline", ftype);
}

llvm::FunctionCallee Lifter::GetFreezeTrampoline(Instance& rinst) {
    const auto ftype = llvm::FunctionType::get(rinst.builder->getVoidTy(), {rinst.builder->getPtrTy()}, false);
    return rinst.module->getOrInsertFunction("FreezeTrampoline", ftype);
}
}
