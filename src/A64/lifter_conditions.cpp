#include "lifter.hpp"
#include "lifter_instructions.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "../llvm.hpp"

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
enum NZCV : uint8_t {
    // Right part (NZCV)
    n = 0b1000,
    z = 0b0100,
    c = 0b0010,
    v = 0b0001,
    // Left part
    nzcv_used = 0b0001 << 4,
};


Value *Lifter::InstructionLifter::ToInt1(llvm::Value *value, bool invert) {
    return rinst.builder->CreateICmp(invert?CmpInst::ICMP_EQ:CmpInst::ICMP_NE, value, rinst.builder->getInt8(0));
}

Value *Lifter::InstructionLifter::GetNZCVCondition() {
    Value *condition = nullptr;
    Value *nzcv = GetNZCV();
    // Check conditions
    bool invert = false;
    switch (detail.cc) {
    case AArch64CC_NE: invert = true; [[fallthrough]];
    case AArch64CC_EQ: {
        condition = rinst.builder->CreateAnd(nzcv, z);
    } break;
    case AArch64CC_LO: invert = true; [[fallthrough]];
    case AArch64CC_HS: {
        condition = rinst.builder->CreateAnd(nzcv, c);
    } break;
    case AArch64CC_PL: invert = true; [[fallthrough]];
    case AArch64CC_MI: {
        condition = rinst.builder->CreateAnd(nzcv, n);
    } break;
    case AArch64CC_VC: invert = true; [[fallthrough]];
    case AArch64CC_VS: {
        condition = rinst.builder->CreateAnd(nzcv, v);
    } break;
    case AArch64CC_LS: invert = true; [[fallthrough]];
    case AArch64CC_HI: {
        condition = rinst.builder->CreateAnd(rinst.builder->CreateAnd(nzcv, c), rinst.builder->CreateAnd(rinst.builder->CreateNot(nzcv), z));
    } break;
    case AArch64CC_GE: invert = true; [[fallthrough]];
    case AArch64CC_LT: {
        condition = rinst.builder->CreateAnd(rinst.builder->CreateXor(nzcv, rinst.builder->CreateShl(nzcv, 3)), n);
    } break;
    case AArch64CC_LE: invert = true; [[fallthrough]];
    case AArch64CC_GT: {
        condition = rinst.builder->CreateNot(rinst.builder->CreateAnd(rinst.builder->CreateXor(nzcv, rinst.builder->CreateShl(nzcv, 3)), n));
        condition = rinst.builder->CreateAnd(condition, rinst.builder->CreateShl(rinst.builder->CreateAnd(rinst.builder->CreateNot(nzcv), z), 1));
    } break;
    case AArch64CC_NV: invert = true; [[fallthrough]];
    case AArch64CC_AL: {
        condition = rinst.builder->getInt8(1);
    } break;
    case AArch64CC_Invalid: DYNAUTIC_ASSERT(!"Invalid condition");
    }
    return ToInt1(condition, invert);
}

Value *Lifter::InstructionLifter::GetComparisonCondition() {
    Value *condition = nullptr;
    auto [left, right] = GetComparison();
    // Check conditions
    bool invert = false;
    switch (detail.cc) {
    case AArch64CC_EQ: {
        condition = rinst.builder->CreateICmpEQ(left, right);
    } break;
    case AArch64CC_NE: {
        condition = rinst.builder->CreateICmpNE(left, right);
    } break;
    case AArch64CC_HS: {
        condition = rinst.builder->CreateICmpUGE(left, right);
    } break;
    case AArch64CC_LO: {
        condition = rinst.builder->CreateICmpULT(left, right);
    } break;
    case AArch64CC_MI: {
        condition = rinst.builder->CreateICmpSLT(left, ConstantInt::get(left->getType(), 0, true));
    } break;
    case AArch64CC_PL: {
        condition = rinst.builder->CreateICmpSGE(left, ConstantInt::get(left->getType(), 0, true));
    } break;
    case AArch64CC_VC: invert = true; [[fallthrough]];
    case AArch64CC_VS: {
        Value *result = rinst.builder->CreateIntrinsic(Intrinsic::ssub_with_overflow, {left->getType(), right->getType()}, {left, right});
        condition = rinst.builder->CreateExtractValue(result, 1);
        if (invert)
            rinst.builder->CreateNot(condition);
    } break;
    case AArch64CC_HI: {
        condition = rinst.builder->CreateICmpUGT(left, right);
    } break;
    case AArch64CC_LS: {
        condition = rinst.builder->CreateICmpULE(left, right);
    } break;
    case AArch64CC_GE: {
        condition = rinst.builder->CreateICmpSGE(left, right);
    } break;
    case AArch64CC_LT: {
        condition = rinst.builder->CreateICmpSLT(left, right);
    } break;
    case AArch64CC_GT: {
        condition = rinst.builder->CreateICmpSGT(left, right);
    } break;
    case AArch64CC_LE: {
        condition = rinst.builder->CreateICmpSLE(left, right);
    } break;
    case AArch64CC_AL: {
        condition = rinst.builder->getInt1(true);
    } break;
    case AArch64CC_NV: {
        condition = rinst.builder->getInt1(false);
    } break;
    default: DYNAUTIC_ASSERT(!"Invalid condition");
    }
    return condition;
}

Value *Lifter::InstructionLifter::GetCondition() {
    /// This function decides if a NZCV based condition should be emitted or a comparison based one.
    /// The comparison based one allows for more optimal performance but the NZCV based one is needed
    /// in some cases.
    /// This is a way to decide about the use of either NZCV or comparision values without branching.
    /// Most of the time LLVM is able to optimize away the part of the equation that isn't needed.
    Value *nzcv = GetNZCV();
    Value *use_comparison = ToInt1(rinst.builder->CreateAnd(rinst.builder->CreateNot(nzcv), nzcv_used));
    Value *use_nzcv = ToInt1(rinst.builder->CreateAnd(nzcv, nzcv_used));
    return rinst.builder->CreateOr(
        rinst.builder->CreateAnd(use_comparison, GetComparisonCondition()),
        rinst.builder->CreateAnd(use_nzcv, GetNZCVCondition()));
}

void Lifter::InstructionLifter::SetComparison(llvm::Value *a, llvm::Value *b) {
    rinst.builder->CreateStore(a, p.rt_values.comparison.first);
    rinst.builder->CreateStore(b, p.rt_values.comparison.second);
    // Unset NZCV used flag
    SetNZCV(rinst.builder->CreateAnd(GetNZCV(), static_cast<uint64_t>(~nzcv_used), "nzcv_"), true);
}

Value *Lifter::InstructionLifter::GetNZCV() {
    return rinst.builder->CreateLoad(rinst.builder->getInt8Ty(), p.rt_values.nzcv);
}

std::pair<Value *, Value *> Lifter::InstructionLifter::GetComparison() {
    return {
        rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), p.rt_values.comparison.first),
        rinst.builder->CreateLoad(rinst.builder->getInt64Ty(), p.rt_values.comparison.second)
    };
}

void Lifter::InstructionLifter::SetNZCV(llvm::Value *value, bool no_mark_used) {
    // Set NZCV used flag
    if (!no_mark_used)
        value = rinst.builder->CreateOr(value, nzcv_used, "nzcv_");
    // Store value
    rinst.builder->CreateStore(value, p.rt_values.nzcv);
}

void Lifter::InstructionLifter::SetNZFromInt(llvm::Value *value) {
    llvm::Value *zero = ConstantInt::get(value->getType(), 0);
    SetNZCV(
        GetN(rinst.builder->CreateICmpSLT(value, zero)),
        GetZ(rinst.builder->CreateICmpEQ(value, zero)));
}

llvm::Value *Lifter::InstructionLifter::GetN(llvm::Value *value) {
    return rinst.builder->CreateSelect(value, rinst.builder->getInt8(n), rinst.builder->getInt8(0));
}

llvm::Value *Lifter::InstructionLifter::GetZ(llvm::Value *value) {
    return rinst.builder->CreateSelect(value, rinst.builder->getInt8(z), rinst.builder->getInt8(0));
}

llvm::Value *Lifter::InstructionLifter::GetC(llvm::Value *value) {
    return rinst.builder->CreateSelect(value, rinst.builder->getInt8(c), rinst.builder->getInt8(0));
}

llvm::Value *Lifter::InstructionLifter::GetV(llvm::Value *value) {
    return rinst.builder->CreateSelect(value, rinst.builder->getInt8(v), rinst.builder->getInt8(0));
}

void Lifter::InstructionLifter::SetNZCV(llvm::Value *n, llvm::Value *z, llvm::Value *c, llvm::Value *v) {
    Value *value = rinst.builder->CreateOr(n, z);
    if (c)
        value = rinst.builder->CreateOr(value, c);
    if (v)
        value = rinst.builder->CreateOr(value, v);
    SetNZCV(value);
}

void Lifter::InstructionLifter::SetNZCVIf(llvm::Value *value, llvm::Value *condition) {
    // Set NZCV used flag
    value = rinst.builder->CreateOr(value, nzcv_used);
    // Select either old or new value
    rinst.builder->CreateStore(rinst.builder->CreateSelect(condition, value, GetNZCV(), "nzcv_"), p.rt_values.nzcv);
}
}
