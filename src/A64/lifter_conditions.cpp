#include "../llvm.hpp"
#include "lifter.hpp"
#include "lifter_instance.hpp"
#include "lifter_instructions.hpp"
#include "runtime.hpp"

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
    return rinst.builder->CreateICmp(invert ? CmpInst::ICMP_EQ : CmpInst::ICMP_NE, value, rinst.CreateInt(8, 0));
}

Value *Lifter::InstructionLifter::GetNZCVCondition() {
    Value *condition = nullptr;
    Value *nzcv = p.rt_values.nzcv;
    // Check conditions
    bool invert = false;
    switch (detail.cc) {
    case AArch64CC_NE:
        invert = true;
        [[fallthrough]];
    case AArch64CC_EQ: {
        condition = rinst.builder->CreateAnd(nzcv, z);
    } break;
    case AArch64CC_LO:
        invert = true;
        [[fallthrough]];
    case AArch64CC_HS: {
        condition = rinst.builder->CreateAnd(nzcv, c);
    } break;
    case AArch64CC_PL:
        invert = true;
        [[fallthrough]];
    case AArch64CC_MI: {
        condition = rinst.builder->CreateAnd(nzcv, n);
    } break;
    case AArch64CC_VC:
        invert = true;
        [[fallthrough]];
    case AArch64CC_VS: {
        condition = rinst.builder->CreateAnd(nzcv, v);
    } break;
    case AArch64CC_LS:
        invert = true;
        [[fallthrough]];
    case AArch64CC_HI: {
        condition = rinst.builder->CreateAnd(rinst.builder->CreateAnd(nzcv, c), rinst.builder->CreateAnd(rinst.builder->CreateNot(nzcv), z));
    } break;
    case AArch64CC_GE:
        invert = true;
        [[fallthrough]];
    case AArch64CC_LT: {
        condition = rinst.builder->CreateAnd(rinst.builder->CreateXor(nzcv, rinst.builder->CreateShl(nzcv, 3)), n);
    } break;
    case AArch64CC_LE:
        invert = true;
        [[fallthrough]];
    case AArch64CC_GT: {
        condition = rinst.builder->CreateNot(rinst.builder->CreateAnd(rinst.builder->CreateXor(nzcv, rinst.builder->CreateShl(nzcv, 3)), n));
        condition = rinst.builder->CreateAnd(condition, rinst.builder->CreateShl(rinst.builder->CreateAnd(rinst.builder->CreateNot(nzcv), z), 1));
    } break;
    case AArch64CC_NV:
        invert = true;
        [[fallthrough]];
    case AArch64CC_AL: {
        condition = rinst.CreateInt(8, 1);
    } break;
    case AArch64CC_Invalid:
        DYNAUTIC_ASSERT(!"Invalid condition");
    }
    return ToInt1(condition, invert);
}

Value *Lifter::InstructionLifter::GetComparisonCondition() {
    Value *condition = nullptr;
    auto [left, right] = p.rt_values.comparison;
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
    case AArch64CC_VC:
        invert = true;
        [[fallthrough]];
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
    default:
        DYNAUTIC_ASSERT(!"Invalid condition");
    }
    return condition;
}

Value *Lifter::InstructionLifter::GetCondition() {
    /// This function decides if a NZCV based condition should be emitted or a
    /// comparison based one. The comparison based one allows for more optimal
    /// performance but the NZCV based one is needed in some cases.
    if (p.rt_values.nzcv && p.rt_values.comparison.first) {
        /// This is a way to decide about the use of either NZCV or comparision
        /// values without branching. Most of the time LLVM is able to optimize away
        /// the part of the equation that isn't needed.
        Value *nzcv = p.rt_values.nzcv;
        Value *use_comparison = ToInt1(rinst.builder->CreateAnd(rinst.builder->CreateNot(nzcv), nzcv_used));
        Value *use_nzcv = ToInt1(rinst.builder->CreateAnd(nzcv, nzcv_used));
        return rinst.builder->CreateOr(rinst.builder->CreateAnd(use_comparison, GetComparisonCondition()),
                                       rinst.builder->CreateAnd(use_nzcv, GetNZCVCondition()));
    } else if (p.rt_values.nzcv) {
        return GetNZCVCondition();
    } else if (p.rt_values.comparison.first) {
        return GetComparisonCondition();
    } else {
        DYNAUTIC_ASSERT(!"Comparison values optimized away");
        if (!rinst.rt.conf.unsafe_unexpected_situation_handling)
            p.CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
        return rinst.builder->getInt1(false);
    }
}

void Lifter::InstructionLifter::SetComparison(llvm::Value *a, llvm::Value *b) {
    p.rt_values.comparison = {a, b};
    p.rt_values.dirty_comparison = true;
    // Unset NZCV used flag
    if (p.rt_values.nzcv) {
        p.rt_values.nzcv = rinst.builder->CreateAnd(p.rt_values.nzcv, ~static_cast<uint64_t>(nzcv_used), "nzcv_");
        p.rt_values.dirty_nzcv = true;
    }
}

void Lifter::InstructionLifter::SetNZCV(llvm::Value *value) {
    p.rt_values.nzcv = value;
    p.rt_values.dirty_nzcv = true;
    // Set NZCV used flag if needed
    if (p.rt_values.comparison.first)
        p.rt_values.nzcv = rinst.builder->CreateOr(p.rt_values.nzcv, nzcv_used, "nzcv_");
}

void Lifter::InstructionLifter::SetNZFromInt(llvm::Value *value) {
    llvm::Value *zero = ConstantInt::get(value->getType(), 0);
    SetNZCV(GetN(rinst.builder->CreateICmpSLT(value, zero)), GetZ(rinst.builder->CreateICmpEQ(value, zero)));
}

void Lifter::InstructionLifter::SetZFromInt(llvm::Value *value) {
    llvm::Value *zero = ConstantInt::get(value->getType(), 0);
    SetNZCV(GetZ(rinst.builder->CreateICmpEQ(value, zero)));
}

llvm::Value *Lifter::InstructionLifter::GetN(llvm::Value *value) { return rinst.builder->CreateSelect(value, rinst.CreateInt(8, n), rinst.CreateInt(8, 0)); }

llvm::Value *Lifter::InstructionLifter::GetZ(llvm::Value *value) { return rinst.builder->CreateSelect(value, rinst.CreateInt(8, z), rinst.CreateInt(8, 0)); }

llvm::Value *Lifter::InstructionLifter::GetC(llvm::Value *value) { return rinst.builder->CreateSelect(value, rinst.CreateInt(8, c), rinst.CreateInt(8, 0)); }

llvm::Value *Lifter::InstructionLifter::GetV(llvm::Value *value) { return rinst.builder->CreateSelect(value, rinst.CreateInt(8, v), rinst.CreateInt(8, 0)); }

void Lifter::InstructionLifter::SetNZCV(llvm::Value *n, llvm::Value *z, llvm::Value *c, llvm::Value *v) {
    Value *value = rinst.builder->CreateOr(n, z);
    if (c)
        value = rinst.builder->CreateOr(value, c);
    if (v)
        value = rinst.builder->CreateOr(value, v);
    SetNZCV(value);
}

void Lifter::InstructionLifter::SetNZCVIf(llvm::Value *value, llvm::Value *condition) {
    p.rt_values.dirty_nzcv = true;
    // Set NZCV used flag if needed
    if (p.rt_values.comparison.first)
        value = rinst.builder->CreateOr(value, nzcv_used);
    // Select either old or new value
    p.rt_values.nzcv = rinst.builder->CreateSelect(condition, value, p.rt_values.nzcv, "nzcv_");
}
} // namespace Dynautic::A64
