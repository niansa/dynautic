#include "lifter.hpp"
#include "lifter_instructions.hpp"
#include "lifter_instructions_macros.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "../llvm.hpp"

#ifdef __aarch64__
#include <llvm/IR/IntrinsicsAArch64.h>
#endif

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
uint8_t Lifter::InstructionLifter::GetLoadStoreFlagsAndSize(uint64_t id) {
    switch (id) {
    case AArch64_INS_ALIAS_STURB:
    case AArch64_INS_STURB:
    case AArch64_INS_ALIAS_LDURB:
    case AArch64_INS_LDURB: extra_flags[unscaled] = extra_flags[byte] = true; break;
    case AArch64_INS_ALIAS_STURH:
    case AArch64_INS_STURH:
    case AArch64_INS_ALIAS_LDURH:
    case AArch64_INS_LDURH: extra_flags[unscaled] = extra_flags[half_word] = true; break;
    case AArch64_INS_ALIAS_LDURSB:
    case AArch64_INS_LDURSB: extra_flags[unscaled] = extra_flags[signed_] = extra_flags[byte] = true; break;
    case AArch64_INS_ALIAS_LDURSH:
    case AArch64_INS_LDURSH: extra_flags[unscaled] = extra_flags[signed_] = extra_flags[half_word] = true; break;
    case AArch64_INS_ALIAS_LDURSW:
    case AArch64_INS_LDURSW: extra_flags[unscaled] = extra_flags[signed_] = extra_flags[word] = true; break;
    case AArch64_INS_ALIAS_STUR:
    case AArch64_INS_STUR:
    case AArch64_INS_ALIAS_LDUR:
    case AArch64_INS_LDUR: extra_flags[unscaled] = true; break;
    case AArch64_INS_ALIAS_STRB:
    case AArch64_INS_STRB:
    case AArch64_INS_ALIAS_LDRB:
    case AArch64_INS_LDRB: extra_flags[byte] = true; break;
    case AArch64_INS_ALIAS_LDRSB:
    case AArch64_INS_LDRSB: extra_flags[signed_] = extra_flags[byte] = true; break;
    case AArch64_INS_ALIAS_LDRH:
    case AArch64_INS_LDRH: extra_flags[half_word] = true; break;
    case AArch64_INS_ALIAS_LDRSH:
    case AArch64_INS_LDRSH: extra_flags[signed_] = extra_flags[half_word] = true; break;
    case AArch64_INS_ALIAS_LDRSW:
    case AArch64_INS_LDRSW: extra_flags[signed_] = extra_flags[word] = true; break;
    case AArch64_INS_STXR:
    case AArch64_INS_LDXR: extra_flags[exclusive] = true; break;
    case AArch64_INS_STXRB:
    case AArch64_INS_LDXRB: extra_flags[byte] = extra_flags[exclusive] = true; break;
    case AArch64_INS_STXRH:
    case AArch64_INS_LDXRH: extra_flags[half_word] = extra_flags[exclusive] = true; break;
    case AArch64_INS_STLXR: extra_flags[exclusive] = extra_flags[release] = true; break;
    case AArch64_INS_STLXRB: extra_flags[byte] = extra_flags[exclusive] = extra_flags[release] = true; break;
    case AArch64_INS_STLXRH: extra_flags[half_word] = extra_flags[exclusive] = extra_flags[release] = true; break;
    case AArch64_INS_ALIAS_STRH:
    case AArch64_INS_STRH: extra_flags[half_word] = true; break;
    case AArch64_INS_ALIAS_STR:
    case AArch64_INS_STR:
    case AArch64_INS_ALIAS_LDR:
    case AArch64_INS_LDR: break;
    default: DYNAUTIC_ASSERT(!"Unknown load/store instruction");
    }

    return extra_flags[byte]?8:extra_flags[half_word]?16:extra_flags[word]?32:0;
}

bool Lifter::InstructionLifter::BaseInstructions(uint64_t id) {
    // Base instructions
    switch (id) {
    // Logical and move instructions
    case AArch64_INS_ALIAS_MOVN:
    case AArch64_INS_MOVN: extra_flags[1] = true; [[fallthrough]];
    case AArch64_INS_MOVK: extra_flags[0] = true; [[fallthrough]];
    case AArch64_INS_ALIAS_MOVZ:
    case AArch64_INS_MOVZ:
    case AArch64_INS_ALIAS_FMOV:
    case AArch64_INS_FMOV:
    case AArch64_INS_ALIAS_MOV:
    case AArch64_INS_MOV: {
        // Get operands
        RegisterDescription left;
        Value *right = nullptr;
        uint64_t right_imm;
        DYNAUTIC_ASSERT(detail.op_count >= 2);
        for (unsigned op_idx = 0; op_idx != 2; ++op_idx) {
            const cs_aarch64_op& op = detail.operands[op_idx];
            switch(op.type) {
            case AArch64_OP_REG: {
                if (op_idx == 0)
                    left = {p.cs_handle, op.reg};
                else
                    right = p.GetRegisterView(rinst, {p.cs_handle, op.reg});
                // Set shift if second operand
                if (op_idx == 1) {
                    shift = static_cast<uint8_t>(op.shift.value);
                    shift_type = op.shift.type;
                }
            } break;
            case AArch64_OP_FP:
            case AArch64_OP_IMM: {
                DYNAUTIC_ASSERT(op_idx == 1);
                right_imm = GetImm(op);
            } break;
            default: {
                DYNAUTIC_ASSERT(!"Unknown operator type in MOV");
                if (rinst.rt.conf.unsafe_unexpected_situation_handling)
                    return true;
                else
                    p.CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
            }
            }
        }
        // Emit IR
        if (right) {
            if (extra_flags[1])
                right = rinst.builder->CreateNot(right);
            p.StoreRegister(rinst, left, right, shift_type, shift);
        } else {
            if (insn.id == AArch64_INS_MOVK || insn.id == AArch64_INS_MOVZ) {
                uint16_t right_imm16 = GetImm16WithShift(right_imm);
                if (extra_flags[1])
                    right_imm16 = ~right_imm16;
                p.StoreRegister16(rinst, left, right_imm16, extra_flags[0], shift_type, shift);
            } else {
                p.StoreRegister(rinst, left, ConstantInt::get(rinst.GetIntType(left.size), right_imm), shift_type, shift);
            }
        }
    } return true;
    case AArch64_INS_ALIAS_AND:
    case AArch64_INS_AND: {
        Handle3Ops(CreateAnd);
    } return true;
    case AArch64_INS_ALIAS_ANDS:
    case AArch64_INS_ANDS: {
        const auto ops = GetOps(3);
        Value *result = rinst.builder->CreateAnd(p.GetRegisterView(rinst, ops[1]), p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2], rinst.GetRegType(ops[1])), shift_type, shift));
        p.StoreRegister(rinst, ops[0], result);
        SetNZFromInt(result);
    } return true;
    case AArch64_INS_ALIAS_TST: {
        const auto ops = GetOps(2);
        Value *result = rinst.builder->CreateAnd(p.GetRegisterView(rinst, ops[0]), p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1], rinst.GetRegType(ops[0])), shift_type, shift));
        SetNZFromInt(result);
    } return true;
    case AArch64_INS_ALIAS_BIC:
    case AArch64_INS_BIC: {
        Handle3OpsNot(CreateAnd);
    } return true;
    case AArch64_INS_ALIAS_BICS:
    case AArch64_INS_BICS: {
        const auto ops = GetOps(3);
        Value *result = rinst.builder->CreateAnd(p.GetRegisterView(rinst, ops[1]), rinst.builder->CreateNot(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2], rinst.GetRegType(ops[1])), shift_type, shift)));
        p.StoreRegister(rinst, ops[0], result);
        SetNZFromInt(result);
    } return true;
    case AArch64_INS_ALIAS_ORR:
    case AArch64_INS_ORR: {
        Handle3Ops(CreateOr);
    } return true;
    case AArch64_INS_ALIAS_MVN:
    case AArch64_INS_MVNI:
    case AArch64_INS_ALIAS_ORN:
    case AArch64_INS_ORN: {
        if (detail.op_count == 2)
            Handle2Ops(CreateNot);
        else
            Handle3OpsNot(CreateOr);
    } return true;
    case AArch64_INS_ALIAS_EOR:
    case AArch64_INS_EOR: {
        Handle3Ops(CreateXor);
    } return true;
    case AArch64_INS_ALIAS_EON:
    case AArch64_INS_EON: {
        Handle3OpsNot(CreateXor);
    } return true;
    case AArch64_INS_ALIAS_ASR:
    case AArch64_INS_ASR: {
        HandleShift(AArch64_SFT_ASR);
    } return true;
    case AArch64_INS_ALIAS_LSL:
    case AArch64_INS_LSL: {
        HandleShift(AArch64_SFT_LSL);
    } return true;
    case AArch64_INS_ALIAS_LSR:
    case AArch64_INS_LSR: {
        HandleShift(AArch64_SFT_LSR);
    } return true;
    case AArch64_INS_ALIAS_ROR:
    case AArch64_INS_ROR: {
        HandleShift(AArch64_SFT_ROR);
    } return true;
    case AArch64_INS_ABS: {
        const auto ops = GetOps(2);
        Type *type = rinst.GetRegType(ops[1]);
        Value *value = p.GetRegisterView(rinst, ops[1]);
        // Could use llvm.abs.*(*, false) instead
        p.StoreRegister(rinst, ops[0], rinst.builder->CreateAdd(rinst.builder->CreateNot(value), ConstantInt::get(type, 1)));
    } return true;
    case AArch64_INS_CSEL: {
        const auto ops = GetOps(3);
        Value *condition = GetCondition();
        if (condition)
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateSelect(condition, p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2])));
    } return true;
    // Arithmetic instructions
    case AArch64_INS_ALIAS_ADD:
    case AArch64_INS_ADD: {
        Handle3Ops(CreateAdd);
    } return true;
    case AArch64_INS_ALIAS_SUBS:
    case AArch64_INS_SUBS: {
        const auto ops = GetOps(3);
        Value *left = p.GetRegisterView(rinst, ops[1]);
        Value *right = p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2], rinst.GetRegType(ops[1])), shift_type, shift);
        SetComparison(left, right);
        p.StoreRegister(rinst, ops[0], rinst.builder->CreateSub(left, right));
    } return true;
    case AArch64_INS_ALIAS_SUB:
    case AArch64_INS_SUB: {
        Handle3Ops(CreateSub);
    } return true;
    case AArch64_INS_MSUB: {
        const auto ops = GetOps(4);
        Value *mul = rinst.builder->CreateMul(p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2]));
        p.StoreRegister(rinst, ops[0], rinst.builder->CreateSub(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[3]), shift_type, shift), mul));
    } return true;
    case AArch64_INS_MADD: {
        const auto ops = GetOps(4);
        Value *mul = rinst.builder->CreateMul(p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2]));
        p.StoreRegister(rinst, ops[0], rinst.builder->CreateAdd(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[3]), shift_type, shift), mul));
    } return true;
    case AArch64_INS_ALIAS_NEG:
    case AArch64_INS_NEG: {
        Handle2Ops(CreateNeg);
    } return true;
    case AArch64_INS_ALIAS_UMULL:
    case AArch64_INS_UMULL: {
        auto ops = GetOps(3);
        Type *type = rinst.GetIntType(64);
        Value *value = rinst.builder->CreateMul(
            rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[1]), type, false),
            rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[2]), type, false));
        p.StoreRegister(rinst, ops[0], value);
    } return true;
    case AArch64_INS_ALIAS_MUL:
    case AArch64_INS_MUL: {
        Handle3Ops(CreateMul);
    } return true;
    case AArch64_INS_UMULH: {
        const auto ops = GetOps(3);
        Value *left = rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[1]), rinst.GetIntType(128), false);
        Value *right = rinst.builder->CreateIntCast(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2]), shift_type, shift), rinst.GetIntType(128), false);
        Value *result = rinst.builder->CreateMul(left, right);
        result = rinst.builder->CreateLShr(result, 64);
        p.StoreRegister(rinst, ops[0], rinst.builder->CreateIntCast(result, rinst.GetIntType(64), false));
    } return true;
    case AArch64_INS_SDIV:
    case AArch64_INS_UDIV: {
        const auto ops = GetOps(3);
        Type *type = rinst.GetRegType(ops[0]);
#ifdef __aarch64__
        // Handle division on arm64 natively
        Intrinsic::ID intr;
        switch (id) {
        case AArch64_INS_SDIV: intr = Intrinsic::aarch64_sdiv; break;
        case AArch64_INS_UDIV: intr = Intrinsic::aarch64_udiv; break;
        }
        Value *value = rinst.builder->CreateIntrinsic(type, intr, {p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2])});
        p.StoreRegister(rinst, ops[0], value);
#else
        // Get operands
        Value *left_value = p.GetRegisterView(rinst, ops[1]),
              *right_value = p.GetRegisterView(rinst, ops[2]);
        // Branching code to prevent division by zero
        BasicBlock *division_branch;
        BasicBlock *division_skip;
        BasicBlock *division_continue;
        if (!p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreDivByZero)) {
            // Check if right side is zero (expect non-zero)
            Value *is_valid = rinst.builder->CreateICmpNE(p.GetRegisterView(rinst, ops[2]), Constant::getNullValue(type), "IsValidDiv");
            is_valid = rinst.builder->CreateIntrinsic(rinst.GetIntType(1), Intrinsic::expect, {is_valid, rinst.CreateInt(1, true)});
            // Create basic blocks
            division_branch = rinst.CreateBasicBlock("DivisionBranch");
            division_skip = rinst.CreateBasicBlock("DivisionSkip");
            division_continue = rinst.CreateBasicBlock("DivisionContinue");
            // Branch accordingly
            rinst.builder->CreateCondBr(is_valid, division_branch, division_skip);
            rinst.UseBasicBlock(division_branch);
        }
        // Do division
        Value *value;
        switch (id) {
        case AArch64_INS_SDIV: value = rinst.builder->CreateSDiv(left_value, right_value); break;
        case AArch64_INS_UDIV: value = rinst.builder->CreateUDiv(left_value, right_value); break;
        }
        rinst.builder->CreateStore(value, p.rt_allocas.temp);
        // Finalize branching code to prevent division by zero
        if (!p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreDivByZero)) {
            rinst.builder->CreateBr(division_continue);
            // Create zero-setting code
            rinst.UseBasicBlock(division_skip);
            rinst.builder->CreateStore(Constant::getNullValue(type), p.rt_allocas.temp);
            rinst.builder->CreateBr(division_continue);
            // Continue as usual
            rinst.UseBasicBlock(division_continue);
        }
        // Store final result
        p.StoreRegister(rinst, ops[0], rinst.builder->CreateLoad(type, p.rt_allocas.temp));
#endif
    } return true;
    case AArch64_INS_ALIAS_SXTB:
    case AArch64_INS_SXTB: extra_flags[byte] = true; [[fallthrough]];
    case AArch64_INS_ALIAS_SXTH:
    case AArch64_INS_SXTH: extra_flags[half_word] = true; [[fallthrough]];
    case AArch64_INS_ALIAS_SXTW:
    case AArch64_INS_SXTW: extra_flags[word] = true; {
            const auto ops = GetOps(2);
            Type *source = nullptr;
            if (extra_flags[byte])
                source = rinst.GetIntType(8);
            else if (extra_flags[half_word])
                source = rinst.GetIntType(16);
            else if (extra_flags[word])
                source = rinst.GetIntType(32);
            else
                DYNAUTIC_ASSERT(!"Invalid source width in sign extend");
            Value *right_value = p.GetRegisterView(rinst, ops[1], source);
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateIntCast(right_value, rinst.GetIntType(64), true));
        } return true;
    case AArch64_INS_ALIAS_CMN: extra_flags[0] = true; [[fallthrough]];
    case AArch64_INS_ALIAS_CMP: {
        const auto ops = GetOps(2);
        Value *right_value = p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1]), shift_type, shift);
        if (extra_flags[0])
            right_value = rinst.builder->CreateNot(right_value);
        SetComparison(p.GetRegisterView(rinst, ops[0]), right_value);
    } return true;
    case AArch64_INS_ADR: {
        const auto ops = GetOps(2);
        p.StoreRegister(rinst, ops[0], p.GetRegisterView(rinst, ops[1]));
    } return true;
    case AArch64_INS_ADRP: {
        const auto ops = GetOps(2);
        p.StoreRegister(rinst, ops[0], p.GetRegisterView(rinst, ops[1]));
    } return true;
    // Load, store and atomic load instructions
    case AArch64_INS_ALIAS_LDURB:
    case AArch64_INS_LDURB:
    case AArch64_INS_ALIAS_LDURH:
    case AArch64_INS_LDURH:
    case AArch64_INS_ALIAS_LDURSB:
    case AArch64_INS_LDURSB:
    case AArch64_INS_ALIAS_LDURSH:
    case AArch64_INS_LDURSH:
    case AArch64_INS_ALIAS_LDURSW:
    case AArch64_INS_LDURSW:
    case AArch64_INS_ALIAS_LDUR:
    case AArch64_INS_LDUR:
    case AArch64_INS_ALIAS_LDRB:
    case AArch64_INS_LDRB:
    case AArch64_INS_ALIAS_LDRSB:
    case AArch64_INS_LDRSB:
    case AArch64_INS_ALIAS_LDRH:
    case AArch64_INS_LDRH:
    case AArch64_INS_ALIAS_LDRSH:
    case AArch64_INS_LDRSH:
    case AArch64_INS_ALIAS_LDRSW:
    case AArch64_INS_LDRSW:
    case AArch64_INS_ALIAS_LDR:
    case AArch64_INS_LDR:
    case AArch64_INS_LDXR:
    case AArch64_INS_LDXRB:
    case AArch64_INS_LDXRH: {
        const uint8_t msiz = GetLoadStoreFlagsAndSize(id);

        const auto op = GetOps(1)[0];
        Value *reference = GetMemOpReference(extra_flags[0]);

        if (extra_flags[exclusive] && !p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
#ifdef __aarch64__
            if (p.rt.conf.native_memory) {
                reference = rinst.builder->CreateIntToPtr(reference, rinst.builder->getPtrTy());
                CallInst *result = rinst.builder->CreateIntrinsic(rinst.GetIntType(64), Intrinsic::aarch64_ldxr, {reference});
                result->addParamAttr(0, Attribute::get(*rinst.context, Attribute::ElementType, rinst.GetIntType(msiz?msiz:op.size)));
                p.StoreRegister(rinst, op, result);
                return true;
            } else {
#endif
                // Tag memory location
                p.CreateExclusiveMonitorTagTrampoline(rinst, reference);
#ifdef __aarch64__
            }
#endif
        }

        Value *value = p.CreateMemoryLoad(rinst, reference, rinst.GetIntType(msiz?msiz:op.size));
        if (msiz)
            value = rinst.builder->CreateIntCast(value, rinst.GetRegType(op), extra_flags[signed_]);
        p.StoreRegister(rinst, op, value);
    } return true;
    case AArch64_INS_ALIAS_STURB:
    case AArch64_INS_STURB:
    case AArch64_INS_ALIAS_STURH:
    case AArch64_INS_STURH:
    case AArch64_INS_ALIAS_STUR:
    case AArch64_INS_STUR:
    case AArch64_INS_ALIAS_STRB:
    case AArch64_INS_STRB:
    case AArch64_INS_ALIAS_STRH:
    case AArch64_INS_STRH:
    case AArch64_INS_ALIAS_STR:
    case AArch64_INS_STR: {
        const uint8_t msiz = GetLoadStoreFlagsAndSize(id);

        const auto op = GetOps(1)[0];
        Value *reference = GetMemOpReference(extra_flags[0]);
        Value *value = p.GetRegisterView(rinst, op);
        if (msiz)
            value = rinst.builder->CreateIntCast(value, rinst.GetIntType(msiz), extra_flags[signed_]);
        p.CreateMemoryStore(rinst, reference, value);
    } return true;
    case AArch64_INS_ALIAS_LDPSW:
    case AArch64_INS_LDPSW: {
        const auto ops = GetOps(2);
        Type *type = rinst.GetRegType(ops[0]);
        Value *reference = GetMemOpReference(false, 2);
        p.StoreRegister(rinst, ops[0], rinst.builder->CreateIntCast(p.CreateMemoryLoad(rinst, reference, rinst.GetIntType(32)), type, true));
        reference = rinst.builder->CreateAdd(reference, rinst.CreateInt(64, ops[0].size/8));
        p.StoreRegister(rinst, ops[1], rinst.builder->CreateIntCast(p.CreateMemoryLoad(rinst, reference, rinst.GetIntType(32)), type, true));
    } return true;
    case AArch64_INS_LDXP: extra_flags[exclusive] = true; [[fallthrough]];
    case AArch64_INS_ALIAS_LDP:
    case AArch64_INS_LDP: {
        const auto ops = GetOps(2);
        Type *type = rinst.GetRegType(ops[0]);
        Value *reference = GetMemOpReference(false, 2);

        if (extra_flags[exclusive] && !p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
#ifdef __aarch64__
            if (p.rt.conf.native_memory) {
                Type *type = rinst.GetRegType(ops[0].size);
                reference = rinst.builder->CreateIntToPtr(reference, rinst.builder->getPtrTy());
                CallInst *result = rinst.builder->CreateIntrinsic(type, Intrinsic::aarch64_ldxp, {reference});
                result->addParamAttr(0, Attribute::get(*rinst.context, Attribute::ElementType, type));
                p.StoreRegister(rinst, ops[0], rinst.builder->CreateExtractValue(result, 0));
                p.StoreRegister(rinst, ops[1], rinst.builder->CreateExtractValue(result, 1));
                return true;
            } else {
#endif
                // Tag memory location
                p.CreateExclusiveMonitorTagTrampoline(rinst, reference);
#ifdef __aarch64__
            }
#endif
        }

        const uint8_t bsiz = ops[0].size/8;
        const uint8_t alignment = extra_flags[exclusive]?bsiz:0;
        p.StoreRegister(rinst, ops[0], p.CreateMemoryLoad(rinst, reference, type, alignment*2));
        reference = rinst.builder->CreateAdd(reference, rinst.CreateInt(64, bsiz));
        p.StoreRegister(rinst, ops[1], p.CreateMemoryLoad(rinst, reference, type, alignment));
    } return true;
    case AArch64_INS_ALIAS_STP:
    case AArch64_INS_STP: {
        const auto ops = GetOps(2);
        Value *reference = GetMemOpReference(false, 2);
        p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[0]));
        reference = rinst.builder->CreateAdd(reference, rinst.CreateInt(64, ops[0].size/8));
        p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[1]));
    } return true;
    case AArch64_INS_ALIAS_SBFX: extra_flags[signed_] = true; [[fallthrough]];
    case AArch64_INS_ALIAS_UBFX: {
        const auto ops = GetOps(2);
        // Calculate bits
        const uint64_t total_bits = ops[0].size;
        const auto shr_bits = total_bits - detail.operands[3].imm;
        const auto shl_bits = shr_bits - detail.operands[2].imm;
        // Generate instructions
        Value *value = rinst.builder->CreateShl(p.GetRegisterView(rinst, ops[1]), shl_bits);
        if (extra_flags[signed_])
            value = rinst.builder->CreateAShr(value, shr_bits);
        else
            value = rinst.builder->CreateLShr(value, shr_bits);
        // Store result to output register
        p.StoreRegister(rinst, ops[0], value);
    } return true;
    case AArch64_INS_ALIAS_SBFIZ: extra_flags[signed_] = true; [[fallthrough]];
    case AArch64_INS_ALIAS_UBFIZ: {
        const auto ops = GetOps(2);
        // Calculate bits
        const uint64_t total_bits = ops[0].size;
        const auto lsb = detail.operands[2].imm;
        const auto width = detail.operands[3].imm;
        const auto sh_bits = total_bits - width;
        // Generate instructions
        Value *value = rinst.builder->CreateShl(p.GetRegisterView(rinst, ops[1]), sh_bits);
        if (extra_flags[signed_])
            value = rinst.builder->CreateAShr(value, sh_bits-lsb);
        else
            value = rinst.builder->CreateLShr(value, sh_bits-lsb);
        // Store result to output register
        p.StoreRegister(rinst, ops[0], value);
    } return true;
    // Atomic store instructions
    case AArch64_INS_CAS:
    case AArch64_INS_CASA:
    case AArch64_INS_CASL:
    case AArch64_INS_CASAL: {
        AtomicOrdering ordering;
        switch (id) {
        case AArch64_INS_CAS: ordering = AtomicOrdering::Monotonic; break;
        case AArch64_INS_CASA: ordering = AtomicOrdering::Acquire; break;
        case AArch64_INS_CASL: ordering = AtomicOrdering::Release; break;
        case AArch64_INS_CASAL: ordering = AtomicOrdering::AcquireRelease; break;
        }

        const auto ops = GetOps(2);
        Value *reference = GetMemOpReference(false, 2);

        if (p.rt.conf.native_memory) {
            reference = rinst.builder->CreateIntToPtr(reference, rinst.builder->getPtrTy());
            Value *value = rinst.builder->CreateAtomicCmpXchg(reference, p.GetRegisterView(rinst, ops[0]), p.GetRegisterView(rinst, ops[1]), MaybeAlign(), ordering, AtomicOrdering::Monotonic);
            value = rinst.builder->CreateExtractValue(value, 0);
            p.StoreRegister(rinst, ops[0], value);
        } else {
            Type *type = rinst.GetRegType(ops[0]);
            BasicBlock *loop;
            if (!p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
                // Create basic block for retry loop
                loop = rinst.CreateBasicBlock("CASRetryLoop");
                // Jump into loop
                rinst.builder->CreateBr(loop);
                rinst.UseBasicBlock(loop);
                // Tag memory location
                p.CreateExclusiveMonitorTagTrampoline(rinst, reference);
            }
            // Load value
            Value *value = p.CreateMemoryLoad(rinst, reference, type);
            // Compare loaded value against first register
            Value *cmp_eq = rinst.builder->CreateICmpEQ(value, p.GetRegisterView(rinst, ops[0]));
            // Select new value
            value = rinst.builder->CreateSelect(cmp_eq, p.GetRegisterView(rinst, ops[1]), value);
            // Write new value to memory
            p.CreateMemoryStore(rinst, reference, value);
            if (!p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
                // Check if memory has been poisoned on the way here
                Value *poisoned = p.CreateExclusiveMonitorIsPoisonedTrampoline(rinst, reference);
                // Untag memory location
                p.CreateExclusiveMonitorUntagTrampoline(rinst, reference);
                // Create continuation basic block
                BasicBlock *continuation = rinst.CreateBasicBlock("CASRetryContinue");
                // Restart loop if poisoned
                rinst.builder->CreateCondBr(poisoned, loop, continuation);
                // Continue outside loop
                rinst.UseBasicBlock(continuation);
            }
            // Write new value to register
            p.StoreRegister(rinst, ops[0], value);
        }
    } return true;
    case AArch64_INS_STXR:
    case AArch64_INS_STXRB:
    case AArch64_INS_STXRH:
    case AArch64_INS_STLXR:
    case AArch64_INS_STLXRB:
    case AArch64_INS_STLXRH: {
        const uint8_t msiz = GetLoadStoreFlagsAndSize(id);

        const auto ops = GetOps(2);
        Value *reference = GetMemOpReference(false, 2);
        Value *value = p.GetRegisterView(rinst, ops[1]);

        if (msiz)
            value = rinst.builder->CreateIntCast(value, rinst.GetIntType(msiz), extra_flags[signed_]);

        if (!p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
#ifdef __aarch64__
            if (p.rt.conf.native_memory) {
                reference = rinst.builder->CreateIntToPtr(reference, rinst.builder->getPtrTy());
                Value *value = rinst.builder->CreateZExt(p.GetRegisterView(rinst, ops[1]), rinst.GetIntType(64));
                CallInst *result = rinst.builder->CreateIntrinsic(Intrinsic::aarch64_stxr, {rinst.builder->getPtrTy()}, {value, reference});
                result->addParamAttr(1, Attribute::get(*rinst.context, Attribute::ElementType, rinst.GetIntType(msiz?msiz:ops[1].size)));
                p.StoreRegister(rinst, ops[0], result);
            } else {
#endif
                // Check for poison
                Value *poisoned = p.CreateExclusiveMonitorIsPoisonedTrampoline(rinst, reference);
                // Untag memory
                p.CreateExclusiveMonitorUntagTrampoline(rinst, reference);
                // Store if not poisoned
                BasicBlock *no_poison_branch = rinst.CreateBasicBlock("NoPoisonStoreBranch");
                BasicBlock *continue_branch = rinst.CreateBasicBlock("NoPoisonStoreContinue");
                rinst.builder->CreateCondBr(poisoned, continue_branch, no_poison_branch);
                rinst.UseBasicBlock(no_poison_branch);
                p.CreateMemoryStore(rinst, reference, value, true);
                rinst.builder->CreateBr(continue_branch);
                rinst.UseBasicBlock(continue_branch);
                // Store result in register
                p.StoreRegister(rinst, ops[0], rinst.builder->CreateSelect(poisoned, rinst.CreateInt(32, 1), rinst.CreateInt(32, 0)));
#ifdef __aarch64__
            }
#endif
        } else {
            p.CreateMemoryStore(rinst, reference, value, true);
            p.StoreRegister(rinst, ops[0], rinst.CreateInt(32, 0));
        }
    } return true;
    case AArch64_INS_STLXP:
    case AArch64_INS_STXP: {
        const auto ops = GetOps(3);
        Value *reference = GetMemOpReference(false, 3);
        if (!p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
#ifdef __aarch64__
            if (p.rt.conf.native_memory) {
                reference = rinst.builder->CreateIntToPtr(reference, rinst.builder->getPtrTy());
                Intrinsic::ID intr;
                switch (id) {
                case AArch64_INS_STLXP: intr = Intrinsic::aarch64_stlxp; break;
                case AArch64_INS_STXP: intr = Intrinsic::aarch64_stxp; break;
                }
                CallInst *result = rinst.builder->CreateIntrinsic(rinst.GetIntType(32), intr, {p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2]), reference});
                result->addParamAttr(2, Attribute::get(*rinst.context, Attribute::ElementType, rinst.GetRegType(ops[1].size)));
                p.StoreRegister(rinst, ops[0], result);
            } else {
#endif
                // Check for poison
                Value *poisoned = p.CreateExclusiveMonitorIsPoisonedTrampoline(rinst, reference);
                // Untag memory
                p.CreateExclusiveMonitorUntagTrampoline(rinst, reference);
                // Store if not poisoned
                BasicBlock *no_poison_branch = rinst.CreateBasicBlock("NoPoisonStoreBranch");
                BasicBlock *continue_branch = rinst.CreateBasicBlock("NoPoisonStoreContinue");
                rinst.builder->CreateCondBr(poisoned, continue_branch, no_poison_branch);
                rinst.UseBasicBlock(no_poison_branch);
                p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[1]));
                reference = rinst.builder->CreateAdd(reference, rinst.CreateInt(64, ops[1].size/8));
                p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[2]));
                rinst.builder->CreateBr(continue_branch);
                rinst.UseBasicBlock(continue_branch);
                // Store result in register
                p.StoreRegister(rinst, ops[0], rinst.builder->CreateSelect(poisoned, rinst.CreateInt(32, 1), rinst.CreateInt(32, 0)));
#ifdef __aarch64__
            }
#endif
        } else {
            p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[0]));
            reference = rinst.builder->CreateAdd(reference, rinst.CreateInt(64, ops[0].size/8));
            p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[1]));
        }
    } return true;
    // Branch instructions
    case AArch64_INS_BL: {
        // Use BLR implementation if address is immediate
        if (detail.operands[0].type != AArch64_OP_IMM) {
            p.StoreRegister(rinst, "x30", rinst.CreateInt(64, insn.address+4));
            CreateCall(0);
            return true;
        }
    } [[fallthrough]];
    case AArch64_INS_BLR: {
        const auto& op = detail.operands[0];
        DYNAUTIC_ASSERT(op.type == AArch64_OP_IMM);
        if (static_cast<VAddr>(op.imm) == insn.address) {
            // Stall forever since this is definitely an infinite loop
            p.CreateDebugPrintTrampoline(rinst, "Infinite loop detected");
            p.CreateFreezeTrampoline(rinst);
            return true;
        }
        p.StoreRegister(rinst, "x30", rinst.CreateInt(64, insn.address+4));
        if (static_cast<VAddr>(op.imm) == insn.address+4) {
            // Don't call since target address is next instruction
            return true;
        }
        CreateCall(0);
    } return true;
    case AArch64_INS_BR:
    case AArch64_INS_B: {
        p.CreateBranch(rinst, PrepareBranch(0));
    } return true;
    case AArch64_INS_CBNZ: extra_flags[0] = true; [[fallthrough]];
    case AArch64_INS_CBZ: {
        p.FinalizeBranchContext(rinst);
        const VAddr false_addr = insn.address+4;
        const auto pred = extra_flags[0]?ICmpInst::ICMP_NE:ICmpInst::ICMP_EQ;
        Value *cond = rinst.builder->CreateICmp(pred, rinst.builder->CreateIntCast(p.GetRegisterView(rinst, GetOps(1)[0]), rinst.GetIntType(64), false), rinst.CreateInt(64, 0));
        p.CreateConditionalBranch(rinst, PrepareBranch(1), p.PrepareBranch(rinst, false_addr), cond);
    } return true;
    case AArch64_INS_TBNZ: extra_flags[0] = true; [[fallthrough]];
    case AArch64_INS_TBZ: {
        const auto ops = GetOps(2);
        p.FinalizeBranchContext(rinst);
        const VAddr false_addr = insn.address+4;
        Value *value = rinst.builder->CreateAnd(p.GetRegisterView(rinst, ops[0]), rinst.builder->CreateShl(ConstantInt::get(rinst.GetRegType(ops[0]), 1), p.GetRegisterView(rinst, ops[1])));
        const auto pred = extra_flags[0]?ICmpInst::ICMP_NE:ICmpInst::ICMP_EQ;
        Value *cond = rinst.builder->CreateICmp(pred, value, ConstantInt::get(rinst.GetRegType(ops[0]), 0));
        std::pair<BasicBlock *, BasicBlock *> branches = {PrepareBranch(2), p.PrepareBranch(rinst, false_addr)};
        p.CreateConditionalBranch(rinst, branches.first, branches.second, cond);
    } return true;
    case AArch64_INS_ALIAS_RET:
    case AArch64_INS_RET: {
        //TODO: Should do some optimization here in cases where the return address can be determined at compile time
        p.CreateCall(rinst, insn.address, p.GetRegisterView(rinst, "x30"));
    } return true;
    // Conditional instruction
    case AArch64_INS_CCMN: extra_flags[0] = true; [[fallthrough]];
    case AArch64_INS_CCMP: {
        const auto ops = GetOps(3);
        Value *imm = rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[2]), rinst.GetIntType(8), false);
        Value *right_value = p.GetRegisterView(rinst, ops[1]);
        Value *condition = GetComparisonCondition();
        if (extra_flags[0])
            right_value = rinst.builder->CreateNot(right_value);
        SetComparison(p.GetRegisterView(rinst, ops[0]), right_value);
        SetNZCVIf(imm, rinst.builder->CreateNot(condition));
    } return true;
    case AArch64_INS_ALIAS_CSET: {
        p.StoreRegister(rinst, GetOps(1)[0], GetCondition());
    } return true;
    // Miscellaneous
    case AArch64_INS_MRS: {
        const auto dest = GetOps(1)[0];
        const auto src = detail.operands[1];
        DYNAUTIC_ASSERT(src.type == AArch64_OP_SYSREG);
        Value *value = nullptr;
        switch (src.sysop.reg.sysreg) {
        case AArch64_SYSREG_CNTFRQ_EL0: value = rinst.CreateInt(32, rinst.rt.conf.cntfrq_el0); break;
        case AArch64_SYSREG_CTR_EL0: value = rinst.CreateInt(32, rinst.rt.conf.ctr_el0); break;
        case AArch64_SYSREG_DCZID_EL0: value = rinst.CreateInt(32, rinst.rt.conf.dczid_el0); break;
        case AArch64_SYSREG_TPIDRRO_EL0: value = p.CreateLoadFromPtr(rinst, reinterpret_cast<const void *>(rinst.rt.conf.tpidrro_el0), rinst.GetIntType(64)); break;
        case AArch64_SYSREG_TPIDR_EL0: value = p.CreateLoadFromPtr(rinst, reinterpret_cast<const void *>(rinst.rt.conf.tpidr_el0), rinst.GetIntType(64)); break;
        default: {
            DYNAUTIC_ASSERT(!"Unknown MRS access");
            if (rinst.rt.conf.unsafe_unexpected_situation_handling) {
                value = rinst.CreateInt(64, 0);
            } else {
                p.CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
                break;
            }
        }
        }
        p.StoreRegister(rinst, dest, value);
    } return true;
    case AArch64_INS_ALIAS_NOP:
    case AArch64_INS_HINT: {
        // This is no-op: It does nothing. Nothing to be done here. We don't need it.
    } return true;
    case AArch64_INS_SVC: {
        const uint32_t swi = static_cast<uint32_t>(detail.operands[0].imm);
        p.CreateSvcTrampoline(rinst, swi);
    } return true;
    case AArch64_INS_ALIAS_WFI: {
        if (rinst.rt.conf.hook_hint_instructions)
            p.CreateExceptionTrampoline(rinst, Exception::WaitForInterrupt);
    } return true;
    case AArch64_INS_ALIAS_WFE: {
        if (rinst.rt.conf.hook_hint_instructions)
            p.CreateExceptionTrampoline(rinst, Exception::WaitForEvent);
    } return true;
    case AArch64_INS_ALIAS_SEV: {
        if (rinst.rt.conf.hook_hint_instructions)
            p.CreateExceptionTrampoline(rinst, Exception::SendEvent);
    } return true;
    case AArch64_INS_ALIAS_SEVL: {
        if (rinst.rt.conf.hook_hint_instructions)
            p.CreateExceptionTrampoline(rinst, Exception::SendEventLocal);
    } return true;
    case AArch64_INS_BRK: {
        if (rinst.rt.conf.hook_hint_instructions)
            p.CreateExceptionTrampoline(rinst, Exception::Breakpoint);
    } return true;
    case AArch64_INS_ALIAS_YIELD: {
        if (rinst.rt.conf.hook_hint_instructions)
            p.CreateExceptionTrampoline(rinst, Exception::Yield);
    } return true;
    }

    // We couldn't handle this instruction
    return false;
}
}
