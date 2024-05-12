#include "lifter.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "cache.hpp"
#include "../llvm.hpp"

#include <optional>
#include <vector>
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
#include <set>
#endif
#include <mutex>
#include <algorithm>

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
void Lifter::LoadFunctionContext(Instance& rinst, bool new_allocas) {
    rt_allocas.dirty = true;

    // Fill in stack pointer
    if (new_allocas)
        rt_allocas.stack_pointer = rinst.builder->CreateAlloca(rinst.builder->getInt64Ty(), nullptr, "alloca_sp_");
    CreateLoadFromGlobalIntoPtr(rinst, "stack_pointer", rinst.builder->getInt64Ty(), rt_allocas.stack_pointer);

    // Fill in general purpose registers
    for (unsigned idx = 0; idx != rt_allocas.registers.size(); ++idx) {
        if (new_allocas)
            rt_allocas.registers[idx] = rinst.builder->CreateAlloca(rinst.builder->getInt64Ty(), nullptr, "alloca_x"+std::to_string(idx)+'_');
        CreateLoadFromGlobalIntoPtr(rinst, "general_register_"+std::to_string(idx), rinst.builder->getInt64Ty(), rt_allocas.registers[idx]);
    }

    // Fill in vector registers
    for (unsigned idx = 0; idx != rt_allocas.vectors.size(); ++idx) {
        if (new_allocas)
            rt_allocas.vectors[idx] = rinst.builder->CreateAlloca(rinst.builder->getInt128Ty(), nullptr, "alloca_q"+std::to_string(idx)+'_');
        CreateLoadFromGlobalIntoPtr(rinst, "vector_register_"+std::to_string(idx), rinst.builder->getInt128Ty(), rt_allocas.vectors[idx]);
    }

    // Fill in comparisation
    if (new_allocas) {
        rt_allocas.comparison.first = rinst.builder->CreateAlloca(rinst.builder->getInt64Ty(), nullptr, "alloca_comp_first_");
        rt_allocas.comparison.second = rinst.builder->CreateAlloca(rinst.builder->getInt64Ty(), nullptr, "alloca_comp_second_");
    }
    CreateLoadFromGlobalIntoPtr(rinst, "comparison_first", rinst.builder->getInt64Ty(), rt_allocas.comparison.first);
    CreateLoadFromGlobalIntoPtr(rinst, "comparison_second", rinst.builder->getInt64Ty(), rt_allocas.comparison.second);

    // Fill in NZCV
    if (new_allocas)
        rt_allocas.nzcv = rinst.builder->CreateAlloca(rinst.builder->getInt8Ty(), nullptr, "alloca_nzcv_");
    CreateLoadFromGlobalIntoPtr(rinst, "nzcv", rinst.builder->getInt8Ty(), rt_allocas.nzcv);

    // Load branch context
    LoadBranchContext(rinst);
}

void Lifter::FinalizeFunctionContext(Instance& rinst) {
    // Finalize branch context
    if (rt_values.dirty)
        FinalizeBranchContext(rinst);

    // Write out stack pointer
    if (rt_allocas.dirty_stack_pointer) {
        CreateStoreToGlobal(rinst, "stack_pointer", rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), rt_allocas.stack_pointer));
        rt_allocas.dirty_stack_pointer = false;
    }

    // Write out general purpose registers
    for (unsigned idx = 0; idx !=rt_allocas. registers.size(); ++idx) {
        if (rt_allocas.dirty_registers[idx]) {
            CreateStoreToGlobal(rinst, "general_register_"+std::to_string(idx), rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), rt_allocas.registers[idx]));
            rt_allocas.dirty_registers[idx] = false;
        }
    }

    // Write out vector registers
    for (unsigned idx = 0; idx != rt_allocas.vectors.size(); ++idx) {
        if (rt_allocas.dirty_vectors[idx]) {
            CreateStoreToGlobal(rinst, "vector_register_"+std::to_string(idx), rinst.builder->CreateLoad(rinst.builder->getInt128Ty(), rt_allocas.vectors[idx]));
            rt_allocas.dirty_vectors[idx] = false;
        }
    }

    // Write out comparisation
    if (rt_allocas.dirty_comparison) {
        CreateStoreToGlobal(rinst, "comparison_first", rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), rt_allocas.comparison.first));
        CreateStoreToGlobal(rinst, "comparison_first", rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), rt_allocas.comparison.second));
        rt_allocas.dirty_comparison = false;
    }

    // Write out NZCV
    if (rt_allocas.dirty_nzcv) {
        CreateStoreToGlobal(rinst, "nzcv", rinst.builder->CreateLoad(rinst.builder->getInt8Ty(), rt_allocas.nzcv));
        rt_allocas.dirty_nzcv = false;
    }

    rt_allocas.dirty = false;
}

void Lifter::LoadBranchContext(Instance& rinst) {
    rt_values.dirty = true;

    // Fill in stack pointer
    rt_values.stack_pointer = rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), rt_allocas.stack_pointer, "sp_");

    // Fill in general purpose registers
    for (unsigned idx = 0; idx != rt_values.registers.size(); ++idx)
        rt_values.registers[idx] = rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), rt_allocas.registers[idx], "x"+std::to_string(idx)+'_');

    // Fill in vector registers
    for (unsigned idx = 0; idx != rt_values.vectors.size(); ++idx)
        rt_values.vectors[idx] = rinst.builder->CreateLoad(rinst.builder->getInt128Ty(), rt_allocas.vectors[idx], "q"+std::to_string(idx)+'_');

    // Fill in comparisation
    rt_values.comparison.first = rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), rt_allocas.comparison.first, "comp_first_");
    rt_values.comparison.second = rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), rt_allocas.comparison.second, "comp_second_");

    // Fill in NZCV
    rt_values.nzcv = rinst.builder->CreateLoad(rinst.builder->getInt8Ty(), rt_allocas.nzcv, "nzcv_");
}

void Lifter::FinalizeBranchContext(Instance& rinst) {
    // Untag any tagged memory
    if (rt_values.exclusive_monitor)
        CreateExclusiveMonitorUntagTrampoline(rinst, rt_values.exclusive_monitor);

    // Write out stack pointer
    if (rt_values.dirty_stack_pointer) {
        rinst.builder->CreateStore(rt_values.stack_pointer, rt_allocas.stack_pointer);
        rt_allocas.dirty_stack_pointer = true;
        rt_values.dirty_stack_pointer = false;
    }

    // Write out general purpose registers
    for (unsigned idx = 0; idx !=rt_values. registers.size(); ++idx) {
        if (rt_values.dirty_registers[idx]) {
            rinst.builder->CreateStore(rt_values.registers[idx], rt_allocas.registers[idx]);
            rt_allocas.dirty_registers[idx] = true;
            rt_values.dirty_registers[idx] = false;
        }
    }

    // Write out vector registers
    for (unsigned idx = 0; idx != rt_values.vectors.size(); ++idx) {
        if (rt_values.dirty_vectors[idx]) {
            rinst.builder->CreateStore(rt_values.vectors[idx], rt_allocas.vectors[idx]);
            rt_allocas.dirty_vectors[idx] = true;
            rt_values.dirty_vectors[idx] = false;
        }
    }

    // Write out comparisation
    if (rt_values.dirty_comparison) {
        rinst.builder->CreateStore(rt_values.comparison.first, rt_allocas.comparison.first);
        rinst.builder->CreateStore(rt_values.comparison.second, rt_allocas.comparison.second);
        rt_allocas.dirty_comparison = true;
        rt_values.dirty_comparison = false;
    }

    // Write out NZCV
    if (rt_values.dirty_nzcv) {
        rinst.builder->CreateStore(rt_values.nzcv, rt_allocas.nzcv);
        rt_allocas.dirty_nzcv = true;
        rt_values.dirty_nzcv = false;
    }

    rt_values.dirty = false;
}

void Lifter::CreatePCSave(Instance& rinst) {
    CreateStoreToPtr(rinst, &rt.pc, rinst.builder->getInt64(rinst.pc));
}

Value *Lifter::CreateLoadFromGlobal(Instance& rinst, llvm::StringRef global_name, llvm::Type *type) {
    return rinst.builder->CreateLoad(type, rinst.module->getOrInsertGlobal(global_name, type));
}

void Lifter::CreateLoadFromGlobalIntoPtr(Instance &rinst, llvm::StringRef global_name, llvm::Type *type, llvm::Value *ptr) {
    rinst.builder->CreateStore(CreateLoadFromGlobal(rinst, global_name, type), ptr);
}

void Lifter::CreateStoreToGlobal(Instance& rinst, llvm::StringRef global_name, llvm::Value *value) {
    rinst.builder->CreateStore(value, rinst.module->getNamedGlobal(global_name));
}

Value *Lifter::CreateLoadFromPtr(Instance& rinst, const void *ptr, Type *type, const llvm::Twine& name) {
    return rinst.builder->CreateLoad(type, rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<uint64_t>(ptr)), rinst.builder->getPtrTy()), name);
}

void Lifter::CreateStoreToPtr(Instance& rinst, void *ptr, llvm::Value *value) {
    rinst.builder->CreateStore(value, rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<uint64_t>(ptr)), rinst.builder->getPtrTy()));
}

Value *Lifter::CreateMemoryLoad(Instance& rinst, llvm::Value *address, Type *type, uint8_t alignment) {
    if (rt.conf.native_memory)
        return rinst.builder->CreateAlignedLoad(type, rinst.builder->CreateIntToPtr(address, rinst.builder->getPtrTy()), MaybeAlign(alignment));

    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());
    Value *fres = rinst.builder->CreateCall(GetMemoryRead(rinst, static_cast<uint8_t>(type->getIntegerBitWidth())), {runtime, address});
    if (rt.conf.check_halt_on_memory_access)
        rinst.builder->CreateCall(GetUpdateExecutionStateTrampoline(rinst), {runtime});
    return fres;
}

void Lifter::CreateMemoryStore(Instance& rinst, llvm::Value *address, llvm::Value *data, bool volatile_, uint8_t alignment) {
    if (rt.conf.native_memory) {
        rinst.builder->CreateAlignedStore(data, rinst.builder->CreateIntToPtr(address, rinst.builder->getPtrTy()), MaybeAlign(alignment), volatile_);
        return;
    }

    if (!rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
        if (rt_values.exclusive_monitor != address) {
            CreateExclusiveMonitorPoisonTrampoline(rinst, address);
        } else if (rt_values.exclusive_monitor) {
            llvm::Value *should_poison = rinst.builder->CreateICmpNE(rt_values.exclusive_monitor, address);
            BasicBlock *poison_branch = rinst.CreateBasicBlock("PoisonBranch");
            BasicBlock *continue_branch = rinst.CreateBasicBlock("PoisonContinue");
            rinst.builder->CreateCondBr(should_poison, poison_branch, continue_branch);
            rinst.UseBasicBlock(poison_branch);
            CreateExclusiveMonitorPoisonTrampoline(rinst, address);
            rinst.builder->CreateBr(continue_branch);
            rinst.UseBasicBlock(continue_branch);
        }
    }

    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());
    rinst.builder->CreateCall(GetMemoryWrite(rinst, static_cast<uint8_t>(data->getType()->getIntegerBitWidth())), {runtime, address, data});
    if (rt.conf.check_halt_on_memory_access)
        rinst.builder->CreateCall(GetUpdateExecutionStateTrampoline(rinst), {runtime});
}

void Lifter::CreateCall(Instance& rinst, VAddr origin, llvm::Value *address, bool no_cache) {
    CreateDebugPrintTrampoline(rinst, "Branching to (likely) non-constant offset");

    CreateLiftTrampoline(rinst, origin, address, no_cache);
}
void Lifter::CreateCall(Instance& rinst, VAddr origin, VAddr address) {
    CreateDebugPrintTrampoline(rinst, "Branching to constant offset");

    // Use deferring lift if configured to
    if (!rt.conf.HasOptimization(OptimizationFlag::BlockLinking))
        return CreateCall(rinst, origin, rinst.builder->getInt64(address));

    // Prepare for call
    FinalizeFunctionContext(rinst);
    // Try to lift given instruction
    DeferLift(address);
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
    CreateDebugPrintTrampoline(rinst, "Preparing to branch... ");

    // Use dynamic branch if block linking is disabled
    if (!rt.conf.HasOptimization(OptimizationFlag::BlockLinking))
        return PrepareBranch(rinst, rinst.pc, rinst.builder->getInt64(address));

    return rinst.QueueBranch(address, "BranchAt"+std::to_string(address));
}

void Lifter::CreateBranch(Instance& rinst, llvm::BasicBlock *block) {
    FinalizeBranchContext(rinst);
    rinst.builder->CreateBr(block);
    rinst.block_terminated = true;
}
void Lifter::CreateConditionalBranch(Instance& rinst, llvm::BasicBlock *true_, llvm::BasicBlock *false_, llvm::Value *condition) {
    FinalizeBranchContext(rinst);
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
        FinalizeFunctionContext(rinst);
        CallInst *call = rinst.builder->CreateCall(GetLiftTrampoline(rinst), {self, address});
        call->setTailCall();
        call->setCallingConv(CallingConv::Tail);
    }
    rinst.builder->CreateRetVoid();
    rinst.block_terminated = true;
}

void Lifter::CreateLiftTrampoline(Instance& rinst, VAddr origin, Value *addr, bool no_cache) {
    FinalizeFunctionContext(rinst);

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

    FinalizeFunctionContext(rinst);
    CreatePCSave(rinst);
    rinst.builder->CreateCall(GetSvcTrampoline(rinst), {runtime, rinst.builder->getInt32(swi)});
    LoadFunctionContext(rinst);
}

void Lifter::CreateExceptionTrampoline(Instance& rinst, Exception exception) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    FinalizeFunctionContext(rinst);
    CreatePCSave(rinst);
    rinst.builder->CreateCall(GetExceptionTrampoline(rinst), {runtime, rinst.builder->getInt64(rinst.pc), rinst.builder->getInt32(static_cast<uint32_t>(exception))});
    CreateLiftTrampoline(rinst, rinst.pc, rinst.builder->getInt64(rinst.pc));
}

void Lifter::CreateFreezeTrampoline(Instance& rinst) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    FinalizeFunctionContext(rinst);
    CreatePCSave(rinst);
    rinst.builder->CreateCall(GetFreezeTrampoline(rinst), {runtime});
    rinst.builder->CreateRetVoid();
    rinst.block_terminated = true;
}

void Lifter::CreateExclusiveMonitorTagTrampoline(Instance& rinst, llvm::Value *addr) {
    #ifdef __aarch64__
    DYNAUTIC_ASSERT(!rt.conf.native_memory);
    #endif

    if (rt_values.exclusive_monitor)
        CreateExclusiveMonitorUntagTrampoline(rinst, rt_values.exclusive_monitor);

    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    rinst.builder->CreateCall(GetExclusiveMonitorTagTrampoline(rinst), {runtime, addr});
    rt_values.exclusive_monitor = addr;
}

void Lifter::CreateExclusiveMonitorUntagTrampoline(Instance& rinst, llvm::Value *addr) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    rinst.builder->CreateCall(GetExclusiveMonitorUntagTrampoline(rinst), {runtime, addr});
    rt_values.exclusive_monitor = nullptr;
}

void Lifter::CreateExclusiveMonitorPoisonTrampoline(Instance& rinst, llvm::Value *addr) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    rinst.builder->CreateCall(GetExclusiveMonitorPoisonTrampoline(rinst), {runtime, addr});
}

llvm::Value *Lifter::CreateExclusiveMonitorIsPoisonedTrampoline(Instance& rinst, llvm::Value *addr) {
    Value *runtime = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(&rt)), rinst.builder->getPtrTy());

    Value *result = rinst.builder->CreateCall(GetExclusiveMonitorIsPoisonedTrampoline(rinst), {runtime, addr});
    return rinst.builder->CreateICmpNE(result, rinst.builder->getInt8(0));
}

void Lifter::CreateDebugPrintTrampoline(Instance& rinst, const char *message) {
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    static std::set<const char*> known_messages;
    if (known_messages.empty())
        outs() << "Runtime debug messages are enabled! To disable, undefine `ENABLE_RUNTIME_DEBUG_MESSAGES`.\n";
    if (known_messages.count(message) == 0)
        outs() << "Runtime debug message: Message \"" << message << "\" maps to " << reinterpret_cast<VAddr>(message) << '\n';
    known_messages.emplace(message);
    Value *msg = rinst.builder->CreateIntToPtr(rinst.builder->getInt64(reinterpret_cast<VAddr>(message)), rinst.builder->getPtrTy());

    rinst.builder->CreateCall(GetDebugPrintTrampoline(rinst), {msg, rinst.builder->getInt64(rinst.pc)});
#else
    (void)rinst;
    (void)message;
#endif
}
}
