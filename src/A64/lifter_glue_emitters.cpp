#include "lifter.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "cache.hpp"
#include "../llvm.hpp"

#include <optional>
#include <vector>
#include <mutex>
#include <algorithm>

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
void Lifter::CreateRegisterRestore(Instance& rinst) {
    // Fill in stack pointer
    rt_values.stack_pointer = CreateLoadFromPtr(rinst, &rt.SP, rinst.builder->getInt64Ty(), "sp_");
    rt_values.dirty_stack_pointer = false;

    // Fill in general purpose registers
    for (unsigned idx = 0; idx != rt_values.registers.size(); ++idx) {
        rt_values.registers[idx] = CreateLoadFromPtr(rinst, &rt.registers[idx], rinst.builder->getInt64Ty(), "r"+std::to_string(idx)+'_');
    }
    rt_values.dirty_registers.fill(false);

    // Fill in vector registers
    for (unsigned idx = 0; idx != rt_values.vectors.size(); ++idx) {
        rt_values.vectors[idx] = CreateLoadFromPtr(rinst, &rt.vectors[idx], rinst.builder->getInt128Ty(), "d"+std::to_string(idx)+'_');
    }
    rt_values.dirty_vectors.fill(false);

    // Fill in comparisation
    if (!rt.conf.HasOptimization(OptimizationFlag::Unsafe_ScopedCMP)) {
        rt_values.comparison.first = CreateLoadFromPtr(rinst, &rt.comparison.first, rinst.builder->getInt64Ty(), "comp_left_");
        rt_values.comparison.second = CreateLoadFromPtr(rinst, &rt.comparison.second, rinst.builder->getInt64Ty(), "comp_right_");
        rt_values.dirty_comparison = false;
    } else {
        rt_values.comparison.first = nullptr;
        rt_values.comparison.second = nullptr;
    }
}

void Lifter::CreateRegisterSave(Instance& rinst) {
    // Write out stack pointer
    if (rt_values.dirty_stack_pointer) {
        CreateStoreToPtr(rinst, &rt.SP, rt_values.stack_pointer);
    }
    rt_values.dirty_stack_pointer = false;

    // Write out general purpose registers
    for (unsigned idx = 0; idx !=rt_values. registers.size(); ++idx) {
        if (!rt_values.dirty_registers[idx])
            continue;
        CreateStoreToPtr(rinst, &rt.registers[idx], rt_values.registers[idx]);
    }
    rt_values.dirty_registers.fill(false);

    // Write out vector registers
    for (unsigned idx = 0; idx != rt_values.vectors.size(); ++idx) {
        if (!rt_values.dirty_vectors[idx])
            continue;
        CreateStoreToPtr(rinst, &rt.vectors[idx], rt_values.vectors[idx]);
    }
    rt_values.dirty_vectors.fill(false);

    // Write out comparisation
    if (rt_values.dirty_comparison && !rt.conf.HasOptimization(OptimizationFlag::Unsafe_ScopedCMP)) {
        CreateStoreToPtr(rinst, &rt.comparison.first, rt_values.comparison.first);
        CreateStoreToPtr(rinst, &rt.comparison.second, rt_values.comparison.second);
    }
    rt_values.dirty_comparison = false;
}

void Lifter::CreatePCSave(Instance& rinst) {
    CreateStoreToPtr(rinst, &rt.PC, rinst.builder->getInt64(rinst.pc));
}

Value *Lifter::CreateLoadFromPtr(Instance& rinst, void *ptr, Type *type, const llvm::Twine& name) {
    return rinst.builder->CreateLoad(type, rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<uint64_t>(ptr)), rinst.builder->getPtrTy()), name);
}

void Lifter::CreateStoreToPtr(Instance& rinst, void *ptr, llvm::Value *value) {
    rinst.builder->CreateStore(value, rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<uint64_t>(ptr)), rinst.builder->getPtrTy()));
}

Value *Lifter::CreateMemoryLoad(Instance& rinst, llvm::Value *address, Type *type) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());
    Value *fres = rinst.builder->CreateCall(GetMemoryRead(rinst, static_cast<uint8_t>(type->getIntegerBitWidth())), {runtime, address});
    if (rt.conf.check_halt_on_memory_access)
        rinst.builder->CreateCall(GetUpdateExecutionStateTrampoline(rinst), {runtime});
    return fres;
}

void Lifter::CreateMemoryStore(Instance& rinst, llvm::Value *address, llvm::Value *data) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());
    rinst.builder->CreateCall(GetMemoryWrite(rinst, static_cast<uint8_t>(data->getType()->getIntegerBitWidth())), {runtime, address, data});
    if (rt.conf.check_halt_on_memory_access)
        rinst.builder->CreateCall(GetUpdateExecutionStateTrampoline(rinst), {runtime});
}

void Lifter::CreateCall(Instance& rinst, VAddr origin, llvm::Value *address, bool no_cache) {
    CreateLiftTrampoline(rinst, origin, address, no_cache);
}
void Lifter::CreateCall(Instance& rinst, VAddr origin, VAddr address) {
    // Use deferring lift if configured to
    if (!rt.conf.HasOptimization(OptimizationFlag::BlockLinking))
        return CreateCall(rinst, origin, rinst.builder->getInt64(address));

    // Prepare for call
    CreateRegisterSave(rinst);
    // Try to lift given instruction
    LiftNested(address);
    // Call into lifted address
    CallInst *call = rinst.builder->CreateCall(Lifter::GetLiftedFunction(rinst, address));
    call->setTailCall();
    call->setCallingConv(CallingConv::Tail);
    rinst.builder->CreateRetVoid();
    rinst.block_terminated = true;
}

llvm::BasicBlock *Lifter::PrepareBranch(Instance& rinst, VAddr origin, Value *address) {
    VAddr *addr;
    BasicBlock *block = rinst.QueueDynamicBranch(addr, origin, "DynamicBranchFrom"+std::to_string(origin));
    Value *addr_ptr = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(addr)), rinst.builder->getPtrTy());
    rinst.builder->CreateStore(address, addr_ptr);
    return block;
}
llvm::BasicBlock *Lifter::PrepareBranch(Instance& rinst, VAddr address) {
    // Use dynamic branchif configured to
    if (!rt.conf.HasOptimization(OptimizationFlag::BlockLinking))
        return PrepareBranch(rinst, rinst.pc, rinst.builder->getInt64(address));

    return rinst.QueueBranch(address, "BranchAt"+std::to_string(address));
}

void Lifter::CreateBranch(Instance& rinst, llvm::BasicBlock *block) {
    CreateRegisterSave(rinst);
    rinst.builder->CreateBr(block);
    rinst.block_terminated = true;
}
void Lifter::CreateConditionalBranch(Instance& rinst, llvm::BasicBlock *true_, llvm::BasicBlock *false_, llvm::Value *condition) {
    CreateRegisterSave(rinst);
    rinst.builder->CreateCondBr(condition, true_, false_);
    rinst.block_terminated = true;
}

void Lifter::CreateUseDynamicBranchCache(Instance& rinst, VAddr origin, Value *addr) {
    auto& cache = rt.cache;

    // Only lock mutex if cache updating is enabled
    std::optional<std::scoped_lock<std::mutex>> L;
    if (rt.conf.update_cache)
        L.emplace(cache.dynamic_branches_mutex);

    if (rt.conf.use_cache) {
        // Get existing cache entries
        auto result = cache.dynamic_branches.find(origin);

        // Create switch case for existing cache entries if any
        if (result != cache.dynamic_branches.end() && !result->second.empty()) {
            const auto entries = result->second;

            // Unlock mutex
            L.reset();

            // Only create switch case if compilation not fully static and more than one entry exists
            if (entries.size() > 1 || !rt.conf.fully_static) {
                // Create switch (TODO: Branch weights?)
                BasicBlock *default_case = rinst.CreateBasicBlock("DefaultCase");
                auto switch_ = rinst.builder->CreateSwitch(addr, default_case, static_cast<unsigned>(entries.size()));

                // Create basic block for each entry (as switch cases)
                for (const auto& [address, uses] : entries) {
                    // Generate case
                    BasicBlock *cache_case = rinst.CreateBasicBlock("CacheCase");
                    switch_->addCase(rinst.builder->getInt64(address), cache_case);
                    // Generate basic block contents
                    rinst.UseBasicBlock(cache_case);
                    CreateCall(rinst, origin, address);
                }

                // Continue using default block
                rinst.UseBasicBlock(default_case);
            } else if (!entries.empty()) {
                // Get only entry
                const auto& [address, uses] = entries.front();
                CreateCall(rinst, origin, address);
            }
        }
    }

    if (rt.conf.update_cache) {
        // Submit call into cache
        Value *cache_ = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&cache)), rinst.builder->getPtrTy());
        rinst.builder->CreateCall(GetCreateDynamicBranchEntryTrampoline(rinst), {cache_, rinst.builder->getInt64(origin), addr});
    }
}

void Lifter::CreateLiftTrampolineBlock(Instance& rinst, VAddr origin, bool no_cache) {
    Value *address_ptr = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(rinst.GetBranchAddrPtr())), rinst.builder->getPtrTy());
    Value *address = rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), address_ptr);

    if (!no_cache) {
        CreateUseDynamicBranchCache(rinst, origin, address);
        if (rinst.block_terminated)
            return;
    }

    Value *self = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(this)), rinst.builder->getPtrTy());

    if (!rt.conf.fully_static) {
        CallInst *call = rinst.builder->CreateCall(GetLiftTrampoline(rinst), {self, address});
        call->setTailCall();
        call->setCallingConv(CallingConv::Tail);
    }
    rinst.builder->CreateRetVoid();
    rinst.block_terminated = true;
}

void Lifter::CreateLiftTrampoline(Instance& rinst, VAddr origin, Value *addr, bool no_cache) {
    CreateRegisterSave(rinst);

    if (!no_cache) {
        CreateUseDynamicBranchCache(rinst, origin, addr);
        if (rinst.block_terminated)
            return;
    }

    Value *self = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(this)), rinst.builder->getPtrTy());

    if (!rt.conf.fully_static) {
        CallInst *call = rinst.builder->CreateCall(GetLiftTrampoline(rinst), {self, addr});
        call->setTailCall();
        call->setCallingConv(CallingConv::Tail);
    }
    rinst.builder->CreateRetVoid();
    rinst.block_terminated = true;
}

void Lifter::CreateSvcTrampoline(Instance& rinst, uint32_t swi) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    CreateRegisterSave(rinst);
    CreatePCSave(rinst);
    rinst.builder->CreateCall(GetSvcTrampoline(rinst), {runtime, rinst.builder->getInt32(swi)});
    CreateRegisterRestore(rinst);
}

void Lifter::CreateExceptionTrampoline(Instance& rinst, Exception exception) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    CreateRegisterSave(rinst);
    CreatePCSave(rinst);
    rinst.builder->CreateCall(GetExceptionTrampoline(rinst), {runtime, rinst.builder->getInt64(rinst.pc), rinst.builder->getInt32(static_cast<uint32_t>(exception))});
    CreateLiftTrampoline(rinst, rinst.pc, rinst.builder->getInt64(rinst.pc));
}

void Lifter::CreateFreezeTrampoline(Instance& rinst) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    CreateRegisterSave(rinst);
    CreatePCSave(rinst);
    rinst.builder->CreateCall(GetFreezeTrampoline(rinst), {runtime});
    rinst.builder->CreateRetVoid();
    rinst.block_terminated = true;
}
}
