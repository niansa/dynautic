#include "lifter_instance.hpp"
#include "../llvm.hpp"

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
Lifter::Instance::Instance(Runtime::Impl& runtime, llvm::LLVMContext *context, llvm::Module *module, const std::string& function_name)
      : rt(runtime), context(context), module(module) {
    // Try to get function first, if that fails, create
    if (!(func = module->getFunction(function_name))) {
        func = Function::Create(FunctionType::get(Type::getVoidTy(*context),
                                                  {}, false),
                                Function::ExternalLinkage, function_name, *module);
    }
    func->setCallingConv(CallingConv::Tail);
}

llvm::FunctionCallee Lifter::Instance::DeclareFunction(llvm::StringRef name) {
    return module->getOrInsertFunction(name, FunctionType::get(Type::getVoidTy(*context),
                                                               {}, false));
}

bool Lifter::Instance::NextBranch() {
    if (queued_branches.empty())
        return false;

    branch = queued_branches.front();
    queued_branches.pop();

    UseBasicBlock(branch->basic_block);
    return true;
}

BasicBlock *Lifter::Instance::QueueBranch(VAddr addr, const Twine &name) {
    // Try to find existing branch
    for (const auto& branch : branches)
        if (branch->addr == addr)
            return branch->basic_block;

    // Actually queue new branch
    auto branch = std::make_unique<Branch>(*this, name);
    branch->SetStatic(addr);
    return queued_branches.emplace(branches.emplace_back(std::move(branch)).get())->basic_block;
}

BasicBlock *Lifter::Instance::QueueDynamicBranch(VAddr *&addr, VAddr origin, const Twine &name) {
    // Queue new dynamic branch
    auto branch = std::make_unique<Branch>(*this, name);
    branch->SetDynamic(origin);
    addr = &branch->addr;
    return queued_branches.emplace(branches.emplace_back(std::move(branch)).get())->basic_block;
}

Type *Lifter::Instance::GetIntType(uint8_t bits) {
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

Type *Lifter::Instance::GetIntVectorType(uint8_t bits, uint8_t elements) {
    return FixedVectorType::get(GetIntType(bits), elements);
}

ConstantInt *Lifter::Instance::CreateInt(uint8_t bits, uint64_t value) {
    return ConstantInt::get(reinterpret_cast<IntegerType*>(GetIntType(bits)), value);
}
}
