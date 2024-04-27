#ifndef LIFTER_INSTANCE_HPP
#define LIFTER_INSTANCE_HPP
#include "lifter.hpp"
#include "runtime.hpp"
#include "../llvm.hpp"

#include <queue>


namespace Dynautic::A64 {
class Lifter::Instance {
public:
    Runtime::Impl& rt;

    llvm::LLVMContext *context;
    llvm::Module *module;
    llvm::Function *func;

private:
    struct Branch {
        llvm::BasicBlock *basic_block;
        bool dynamic = false;
        VAddr addr, origin;

        Branch(Lifter::Instance& parent, const llvm::Twine& name) {
            basic_block = llvm::BasicBlock::Create(*parent.context, name, parent.func);
        }
        Branch(const Branch&) = delete;
        Branch(Branch&&) = delete;

        void SetStatic(VAddr addr) {
            dynamic = false;
            this->addr = addr;
        }
        void SetDynamic(VAddr origin) {
            dynamic = true;
            this->origin = origin;
        }
    };
    Branch *branch;
    std::queue<Branch*> queued_branches;
    std::vector<std::unique_ptr<Branch>> branches;

public:
    std::optional<llvm::IRBuilder<>> builder;
    bool block_terminated;
    VAddr pc;

    Instance(Runtime::Impl& runtime, llvm::LLVMContext *context, llvm::Module *module, const llvm::Twine& function_name);

    llvm::BasicBlock *CreateBasicBlock(const llvm::Twine& name) {
        return llvm::BasicBlock::Create(*context, name, func);
    }
    void UseBasicBlock(llvm::BasicBlock *basic_block) {
        branch->basic_block = basic_block;
        builder->SetInsertPoint(basic_block);
        block_terminated = false; // Assume new block hasn't been terminated yet
    }

    llvm::Function *DeclareFunction(const llvm::Twine& name);

    bool NextBranch();

    llvm::BasicBlock *QueueBranch(VAddr addr, const llvm::Twine& name);
    llvm::BasicBlock *QueueDynamicBranch(VAddr*& addr, VAddr origin, const llvm::Twine& name);

    bool IsDynamicBranch() const {
        return branch->dynamic;
    }
    VAddr GetBranchOrigin() const {
        return branch->origin;
    }
    VAddr GetBranchAddr() const {
        return branch->addr;
    }
    VAddr *GetBranchAddrPtr() {
        return &branch->addr;
    }
};
}

#endif // LIFTER_INSTANCE_HPP
