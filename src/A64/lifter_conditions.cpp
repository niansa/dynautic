#include "lifter.hpp"
#include "lifter_instructions.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "../llvm.hpp"

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
enum NZCV : uint8_t {
    n = 0b1000,
    z = 0b0100,
    c = 0b0010,
    v = 0b0001,
    nzcv_used = 0b10000
};


Value *Lifter::InstructionLifter::ToInt1(llvm::Value *value, bool invert) {
    return rinst.builder->CreateICmp(invert?CmpInst::ICMP_EQ:CmpInst::ICMP_NE, value, rinst.builder->getInt8(0));
}

Value *Lifter::InstructionLifter::GetNZCVCondition() {
    Value *condition = nullptr;
    Value *nzcv = p.rt_values.nzcv;
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
    auto [left, right] = p.rt_values.comparison;
    // Check conditions
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
    case AArch64CC_VC: // TODO: Implement
    case AArch64CC_VS: { // TODO: Implement{
        DYNAUTIC_ASSERT(!"Comparison code not implemented");
        if (rinst.rt.conf.unsafe_unexpected_situation_handling)
            condition = rinst.builder->getInt1(false);
        else
            p.CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
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
    if (p.rt_values.nzcv && p.rt_values.comparison.first) {
        /// This is a way to decide about the use of either NZCV or comparision values without branching.
        /// Most of the time LLVM is able to optimize away the part of the equation that isn't needed.
        Value *nzcv = p.rt_values.nzcv;
        Value *use_comparison = ToInt1(rinst.builder->CreateAnd(rinst.builder->CreateNot(nzcv), nzcv_used));
        Value *use_nzcv = ToInt1(rinst.builder->CreateAnd(nzcv, nzcv_used));
        return rinst.builder->CreateOr(
            rinst.builder->CreateAnd(use_comparison, GetComparisonCondition()),
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
    p.rt_values.comparison = {
        rinst.builder->CreateIntCast(a, rinst.builder->getInt64Ty(), false, "comp_first_"),
        rinst.builder->CreateIntCast(b, rinst.builder->getInt64Ty(), false, "comp_second_")
    };
    p.rt_values.dirty_comparison = true;
    // Unset NZCV used flag
    if (p.rt_values.nzcv) {
        p.rt_values.nzcv = rinst.builder->CreateAnd(p.rt_values.nzcv, ~nzcv_used, "nzcv_");
        p.rt_values.dirty_nzcv = true;
    }
}

void Lifter::InstructionLifter::SetNZCV(llvm::Value *value) {
    value->setName("nzcv_");
    p.rt_values.nzcv = value;
    p.rt_values.dirty_nzcv = true;
    // Set NZCV used flag if needed
    if (p.rt_values.comparison.first)
        p.rt_values.nzcv = rinst.builder->CreateOr(p.rt_values.nzcv, nzcv_used, "nzcv_");
}

void Lifter::InstructionLifter::SetNZCVIf(llvm::Value *value, llvm::Value *condition) {
    p.rt_values.dirty_nzcv = true;
    // Set NZCV used flag if needed
    if (p.rt_values.comparison.first)
        value = rinst.builder->CreateOr(value, nzcv_used);
    // Select either old or new value
    p.rt_values.nzcv = rinst.builder->CreateSelect(condition, value, p.rt_values.nzcv, "nzcv_");
}
}
