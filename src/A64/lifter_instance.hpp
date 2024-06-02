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
        VAddr addr = -1, origin;
        llvm::BasicBlock *current_basic_block;

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
    llvm::BasicBlock *current_basic_block;

    llvm::ArrayRef<llvm::Type*> GetFunctionArgTypes() const;

public:
    std::optional<llvm::IRBuilder<>> builder;
    bool block_terminated;
    VAddr pc = 0xbad0bad0bad0bad0;

    Instance(Runtime::Impl& runtime, llvm::LLVMContext *context, llvm::Module *module, const std::string& function_name);

    llvm::BasicBlock *CreateBasicBlock(const llvm::Twine& name) {
        return llvm::BasicBlock::Create(*context, name, func);
    }
    void UseBasicBlock(llvm::BasicBlock *basic_block) {
        current_basic_block = basic_block;
        if (!builder.has_value())
            builder.emplace(basic_block);
        else
            builder->SetInsertPoint(current_basic_block);
        block_terminated = false; // Assume new block hasn't been terminated yet
    }

    llvm::FunctionCallee DeclareFunction(llvm::StringRef name);

    bool NextBranch();

    llvm::BasicBlock *GetBranch(VAddr addr) const;
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

    llvm::Type *GetIntType(uint8_t bits) {
        switch (bits) {
        case 1: return builder->getInt1Ty();
        case 8: return builder->getInt8Ty();
        case 16: return builder->getInt16Ty();
        case 32: return builder->getInt32Ty();
        case 64: return builder->getInt64Ty();
        case 128: return builder->getInt128Ty();
        }

        DYNAUTIC_ASSERT(!"Invalid bit count");
        return nullptr;
    }
    llvm::Type *GetIntVectorType(uint8_t bits, uint8_t elements) {
        return llvm::FixedVectorType::get(GetIntType(bits), elements);
    }
    llvm::Type *GetRegType(const RegisterDescription& desc) {
        if (desc.type != RegisterDescription::Type::vector)
            return GetIntType(desc.size);
        else
            return GetIntVectorType(desc.size, desc.elements);
    }
    llvm::ConstantInt *CreateInt(uint8_t bits, uint64_t value) {
        return llvm::ConstantInt::get(reinterpret_cast<llvm::IntegerType*>(GetIntType(bits)), value);
    }
};
}

#endif // LIFTER_INSTANCE_HPP
