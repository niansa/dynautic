#include "lifter_instance.hpp"
#include "../arch_traits.hpp"
#include "../llvm.hpp"

using namespace llvm;
using namespace llvm::orc;

namespace Dynautic::A64 {
llvm::ArrayRef<Type *> Lifter::Instance::GetFunctionArgTypes() const {
    thread_local static std::array<llvm::Type *, ArchTraits::max_arg_count> fres;
    fres.fill(Type::getInt64Ty(*context));
    return fres;
}

Lifter::Instance::Instance(Runtime::Impl& runtime, llvm::LLVMContext *context, llvm::Module *module, const std::string& function_name)
    : rt(runtime), context(context), module(module) {
    // Try to get function first, if that fails, create
    if (!(func = module->getFunction(function_name))) {
        func = Function::Create(FunctionType::get(Type::getVoidTy(*context), GetFunctionArgTypes(), false), Function::ExternalLinkage, function_name, *module);
    }
    func->setCallingConv(CallingConv::Tail);
}

llvm::FunctionCallee Lifter::Instance::DeclareFunction(llvm::StringRef name) {
    return module->getOrInsertFunction(name, FunctionType::get(Type::getVoidTy(*context), GetFunctionArgTypes(), false));
}

bool Lifter::Instance::NextBranch() {
    if (queued_branches.empty())
        return false;

    branch = queued_branches.front();
    queued_branches.pop();

    UseBasicBlock(branch->basic_block);
    return true;
}

BasicBlock *Lifter::Instance::GetBranch(VAddr addr) const {
    for (const auto& branch : branches)
        if (branch->addr == addr)
            return branch->basic_block;
    return nullptr;
}

BasicBlock *Lifter::Instance::QueueBranch(VAddr addr, const Twine& name) {
    // Try to find existing branch
    for (const auto& branch : branches)
        if (branch->addr == addr)
            return branch->basic_block;

    // Actually queue new branch
    auto branch = std::make_unique<Branch>(*this, name);
    branch->SetStatic(addr);
    return queued_branches.emplace(branches.emplace_back(std::move(branch)).get())->basic_block;
}

BasicBlock *Lifter::Instance::QueueDynamicBranch(VAddr *& addr, VAddr origin, const Twine& name) {
    // Queue new dynamic branch
    auto branch = std::make_unique<Branch>(*this, name);
    branch->SetDynamic(origin);
    addr = &branch->addr;
    return queued_branches.emplace(branches.emplace_back(std::move(branch)).get())->basic_block;
}
} // namespace Dynautic::A64
