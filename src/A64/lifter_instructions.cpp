#include "lifter.hpp"
#include "lifter_instructions.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "../llvm.hpp"

#ifdef __aarch64__
#include <llvm/IR/IntrinsicsAArch64.h>
#endif

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
uint64_t Lifter::InstructionLifter::GetImm(const cs_aarch64_op& op) {
    shift = static_cast<uint8_t>(op.shift.value);
    shift_type = op.shift.type;
    switch (op.type) {
    case AArch64_OP_IMM: return static_cast<uint64_t>(op.imm);
    case AArch64_OP_FP: return *reinterpret_cast<const uint64_t *>(&op.fp);
    default: DYNAUTIC_ASSERT(!"Unsupported immediate type");
    }
    return 0;
}

uint16_t Lifter::InstructionLifter::GetImm16WithShift(uint64_t value) {
    if (shift_type != AArch64_SFT_INVALID)
        return static_cast<uint16_t>(value);
    // Get first matching bitmask to determine shift
    if (value == 0)
        shift = 0;
    else if (value & 0x000000000000fffful && !(value & ~0x000000000000fffful))
        shift = 0;
    else if (value & 0x00000000ffff0000ul && !(value & ~0x00000000ffff0000ul))
        shift = 16;
    else if (value & 0x0000ffff00000000ul && !(value & ~0x0000ffff00000000ul))
        shift = 32;
    else if (value & 0xffff000000000000ul && !(value & ~0xffff000000000000ul))
        shift = 48;
    else {DYNAUTIC_ASSERT(!"GetImmShift applied incorrectly");}
    // Set shift type and result
    if (shift) {
        shift_type = AArch64_SFT_LSL;
        return static_cast<uint16_t>(value >> shift);
    } else {
        return static_cast<uint16_t>(value);
    }
}

RegisterDescription Lifter::InstructionLifter::GetImmAsReg(const cs_aarch64_op& op, bool as_word) {
    auto fres = p.AllocateScratchRegister(as_word);
    const auto imm = GetImm(op);
    p.GetRawRegister(fres, true) = as_word?rinst.builder->getInt32(static_cast<uint32_t>(imm)):rinst.builder->getInt64(imm);
    return fres;
}

std::array<RegisterDescription, Lifter::InstructionLifter::GetOps_max_op_count> Lifter::InstructionLifter::GetOps(unsigned op_count) {
    DYNAUTIC_ASSERT(op_count <= GetOps_max_op_count);
    std::array<RegisterDescription, GetOps_max_op_count> regs;
    for (unsigned op_idx = 0; op_idx != op_count; ++op_idx) {
        // Get operand value
        const cs_aarch64_op& op = detail.operands[op_idx];
        switch(op.type) {
        case AArch64_OP_REG: {
            // Get register
            regs[op_idx] = {p.cs_handle, op.reg};
        } break;
        case AArch64_OP_IMM: {
            // Load from immediate
            regs[op_idx] = GetImmAsReg(op, regs[0].size == RegisterDescription::word);
        } break;
        case AArch64_OP_MEM_REG: {
            // Add up references
            Value *reference = rinst.builder->CreateAdd(p.GetRegisterView(rinst, {p.cs_handle, op.mem.base}), p.GetRegisterView(rinst, {p.cs_handle, op.mem.index}));
            reference = rinst.builder->CreateAdd(reference, rinst.builder->getInt32(op.mem.disp));
            // Load value from reference
            DYNAUTIC_ASSERT(op_idx != 0);
            auto value_reg = p.AllocateScratchRegister(regs[0].size == RegisterDescription::word);
            p.GetRawRegister(value_reg, true) = rinst.builder->CreateLoad(rinst.GetType(value_reg.size), reference);
            regs[op_idx] = value_reg;
        } break;
        case AArch64_OP_INVALID: {
            // Copy last register onto self to fill list
            if (op_idx != 0) {
                regs[op_idx] = regs[op_idx-1];
                break;
            }
        } [[fallthrough]];
        default: {
            DYNAUTIC_ASSERT(!"Unknown operand type");
            if (rinst.rt.conf.unsafe_unexpected_situation_handling)
                regs[op_idx] = "xzr";
            else
                p.CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
        }
        }
        // Get shift if none found yet
        if (shift_type == AArch64_SFT_INVALID) {
            shift = static_cast<uint8_t>(op.shift.value);
            shift_type = op.shift.type;
        }
    }
    return regs;
}

void Lifter::InstructionLifter::CreateCall(unsigned op_idx) {
    const cs_aarch64_op& op = detail.operands[op_idx];
    switch(op.type) {
    case AArch64_OP_REG: {
        // Queue dynamic branch for lift
        return p.CreateCall(rinst, insn.address, p.GetRegisterView(rinst, {p.cs_handle, op.reg}));
    } break;
    case AArch64_OP_IMM: {
        // Queue branch for lift
        return p.CreateCall(rinst, insn.address, static_cast<VAddr>(op.imm));
    } break;
    default: {
        DYNAUTIC_ASSERT(!"Unknown operand type");
        if (!rinst.rt.conf.unsafe_unexpected_situation_handling)
            p.CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
    }
    }
}

BasicBlock *Lifter::InstructionLifter::PrepareBranch(unsigned op_idx) {
    const cs_aarch64_op& op = detail.operands[op_idx];
    switch(op.type) {
    case AArch64_OP_REG: {
        // Queue dynamic branch for lift
        return p.PrepareBranch(rinst, insn.address, p.GetRegisterView(rinst, {p.cs_handle, op.reg}));
    } break;
    case AArch64_OP_IMM: {
        // Queue branch for lift
        return p.PrepareBranch(rinst, static_cast<VAddr>(op.imm));
    } break;
    default: {
        DYNAUTIC_ASSERT(!"Unknown operand type");
        p.CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
        return nullptr;
    }
    }
}

Value *Lifter::InstructionLifter::GetMemOpReference(bool unscaled, unsigned op_idx) {
    const auto& addrop = detail.operands[op_idx];
    DYNAUTIC_ASSERT(addrop.type == AArch64_OP_MEM);
    RegisterDescription base_reg(p.cs_handle, addrop.mem.base);
    Value *base = p.GetRegisterView(rinst, base_reg);
    int32_t displacement = addrop.mem.disp;
    if (unscaled)
        base = p.PerformShift(rinst, base, addrop.shift.type, static_cast<uint8_t>(addrop.shift.value));
    else
        displacement = static_cast<int32_t>(p.PerformShift(static_cast<uint64_t>(displacement), 32, addrop.shift.type, static_cast<uint8_t>(addrop.shift.value)));
    Value *reference = rinst.builder->CreateAdd(base, p.GetRegisterView(rinst, {p.cs_handle, addrop.mem.index}));
    Value *displaced_reference = rinst.builder->CreateAdd(reference, ConstantInt::get(reference->getType(), static_cast<uint64_t>(displacement)));
    if (insn.detail->writeback)
        p.StoreRegister(rinst, base_reg, displaced_reference);
    if (displacement && !detail.post_index)
        reference = displaced_reference;
    return reference;
}

uint8_t Lifter::InstructionLifter::GetLoadStoreFlagsAndSize(uint64_t insn_id) {
    //TODO: Validate if behavior is correct
    switch (insn_id) {
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

void Lifter::InstructionLifter::DeferCompilation(bool repeat_instruction) {
    // Below function terminates the block
    p.CreateLiftTrampoline(rinst, insn.address, rinst.builder->getInt64(insn.address+(repeat_instruction?0:4)));
}

#define Handle1Op(func) \
    do { \
        const auto op = GetOps(1)[0]; \
        func(p.PerformShift(rinst, p.GetRegisterView(rinst, op), shift_type, shift)); \
    } while (0)
#define Handle2Ops(func) \
    do { \
        const auto ops = GetOps(2); \
        p.StoreRegister(rinst, ops[0], rinst.builder->func(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1]), shift_type, shift))); \
    } while (0)
#define Handle3Ops(func) \
    do { \
        const auto ops = GetOps(3); \
        p.StoreRegister(rinst, ops[0], rinst.builder->func(p.GetRegisterView(rinst, ops[1]), rinst.builder->CreateIntCast(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2]), shift_type, shift), rinst.GetType(ops[1].size), false))); \
    } while (0)
#define Handle3OpsNot(func) \
    do { \
        const auto ops = GetOps(3); \
        p.StoreRegister(rinst, ops[0], rinst.builder->func(p.GetRegisterView(rinst, ops[1]), rinst.builder->CreateNot(rinst.builder->CreateIntCast(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2]), shift_type, shift), rinst.GetType(ops[1].size), false)))); \
    } while (0)

#define HandleShift(type) \
    do { \
        const auto ops = GetOps(3); \
        if (ops[1] != ops[2]) { \
            p.StoreRegister(rinst, ops[0], p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1]), type, p.GetRegisterView(rinst, ops[2]))); \
        } else { \
            DYNAUTIC_ASSERT(shift_type == type); \
            p.StoreRegister(rinst, ops[0], p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1]), type, shift)); \
        } \
    } while (0)

bool Lifter::InstructionLifter::Run() {    
    // Update PC
    rinst.pc = insn.address;

    // Check alignment
    DYNAUTIC_ASSERT((insn.address % 4) == 0);

    // Debug message
    p.CreateDebugPrintTrampoline(rinst, "Executing instruction");

    // Handle conditional predicates (except CSEL and CCMP)
    RuntimeValues rt_values_backup;
    BasicBlock *next_block = nullptr;
    const bool conditional = detail.cc != AArch64CC_Invalid
                             && insn.id != AArch64_INS_CSEL
                             && insn.alias_id != AArch64_INS_ALIAS_CSET
                             && insn.id != AArch64_INS_CCMN
                             && insn.id != AArch64_INS_CCMP;
    if (conditional) {
        Value *condition = GetCondition();
        if (!condition)
            return false;
        // Create branch
        BasicBlock *true_block = rinst.CreateBasicBlock("ConditionalPredTrue");
        next_block = rinst.CreateBasicBlock("ConditionalPredEnd");
        rt_values_backup = p.rt_values;
        rinst.builder->CreateCondBr(condition, true_block, next_block);
        rinst.UseBasicBlock(true_block);
        p.CreateDebugPrintTrampoline(rinst, "Taking `true` branch in conditional predicate");
    }

    // Handle instruction
    [this] () {
        // Get instruction id
        const uint64_t id = insn.is_alias ? insn.alias_id : insn.id;

        // Big switch table for all instructions we need to handle
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
                        return;
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
                    p.StoreRegister(rinst, left, ConstantInt::get(rinst.GetType(left.size), right_imm), shift_type, shift);
                }
            }
        } return;
        case AArch64_INS_ALIAS_AND:
        case AArch64_INS_AND: {
            Handle3Ops(CreateAnd);
        } return;
        case AArch64_INS_ALIAS_ANDS:
        case AArch64_INS_ANDS: {
            const auto ops = GetOps(3);
            Value *result = rinst.builder->CreateAnd(p.GetRegisterView(rinst, ops[1]), rinst.builder->CreateIntCast(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2]), shift_type, shift), rinst.GetType(ops[1].size), false));
            p.StoreRegister(rinst, ops[0], result);
            SetNZFromInt(result);
        } return;
        case AArch64_INS_ALIAS_TST: {
            const auto ops = GetOps(2);
            Value *result = rinst.builder->CreateAnd(p.GetRegisterView(rinst, ops[0]), rinst.builder->CreateIntCast(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[1]), shift_type, shift), rinst.GetType(ops[0].size), false));
            SetNZFromInt(result);
        } return;
        case AArch64_INS_ALIAS_BIC:
        case AArch64_INS_BIC: {
            Handle3OpsNot(CreateAnd);
        } return;
        case AArch64_INS_ALIAS_BICS:
        case AArch64_INS_BICS: {
            const auto ops = GetOps(3);
            Value *result = rinst.builder->CreateAnd(p.GetRegisterView(rinst, ops[1]), rinst.builder->CreateNot(rinst.builder->CreateIntCast(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2]), shift_type, shift), rinst.GetType(ops[1].size), false)));
            p.StoreRegister(rinst, ops[0], result);
            SetNZFromInt(result);
        } return;
        case AArch64_INS_ALIAS_ORR:
        case AArch64_INS_ORR: {
            Handle3Ops(CreateOr);
        } return;
        case AArch64_INS_ALIAS_MVN:
        case AArch64_INS_MVNI:
        case AArch64_INS_ALIAS_ORN:
        case AArch64_INS_ORN: {
            if (detail.op_count == 2)
                Handle2Ops(CreateNot);
            else
                Handle3OpsNot(CreateOr);
        } return;
        case AArch64_INS_ALIAS_EOR:
        case AArch64_INS_EOR: {
            Handle3Ops(CreateXor);
        } return;
        case AArch64_INS_ALIAS_EON:
        case AArch64_INS_EON: {
            Handle3OpsNot(CreateXor);
        } return;
        case AArch64_INS_ALIAS_ASR:
        case AArch64_INS_ASR: {
            HandleShift(AArch64_SFT_ASR);
        } return;
        case AArch64_INS_ALIAS_LSL:
        case AArch64_INS_LSL: {
            HandleShift(AArch64_SFT_LSL);
        } return;
        case AArch64_INS_ALIAS_LSR:
        case AArch64_INS_LSR: {
            HandleShift(AArch64_SFT_LSR);
        } return;
        case AArch64_INS_ALIAS_ROR:
        case AArch64_INS_ROR: {
            HandleShift(AArch64_SFT_ROR);
        } return;
        case AArch64_INS_ABS: {
            const auto ops = GetOps(2);
            Type *type = rinst.GetType(ops[1].size);
            Value *value = p.GetRegisterView(rinst, ops[1]);
            // Could use llvm.abs.*(*, false) instead
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateAdd(rinst.builder->CreateNot(value), ConstantInt::get(type, 1)));
        } return;
        case AArch64_INS_CSEL: {
            const auto ops = GetOps(3);
            Value *condition = GetCondition();
            if (!condition)
                break;
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateSelect(condition, p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2])));
        } return;
        // Arithmetic instructions
        case AArch64_INS_ALIAS_ADD:
        case AArch64_INS_ADD: {
            Handle3Ops(CreateAdd);
        } return;
        case AArch64_INS_ALIAS_SUBS:
        case AArch64_INS_SUBS: {
            const auto ops = GetOps(3);
            Value *left = p.GetRegisterView(rinst, ops[1]);
            Value *right = p.PerformShift(rinst, rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[2]), rinst.GetType(ops[1].size), false), shift_type, shift);
            SetComparison(left, right);
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateSub(left, right));
        } [[fallthrough]];
        case AArch64_INS_ALIAS_SUB:
        case AArch64_INS_SUB: {
            Handle3Ops(CreateSub);
        } return;
        case AArch64_INS_MSUB: {
            const auto ops = GetOps(4);
            Value *mul = rinst.builder->CreateMul(p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2]));
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateSub(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[3]), shift_type, shift), mul));
        } return;
        case AArch64_INS_MADD: {
            const auto ops = GetOps(4);
            Value *mul = rinst.builder->CreateMul(p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2]));
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateAdd(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[3]), shift_type, shift), mul));
        } return;
        case AArch64_INS_ALIAS_NEG:
        case AArch64_INS_NEG: {
            Handle2Ops(CreateNeg);
        } return;
        case AArch64_INS_ALIAS_UMULL:
        case AArch64_INS_UMULL: {
            auto ops = GetOps(3);
            Type *type = rinst.builder->getInt64Ty();
            Value *value = rinst.builder->CreateMul(
                rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[1]), type, false),
                rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[2]), type, false));
            p.StoreRegister(rinst, ops[0], value);
        } break;
        case AArch64_INS_ALIAS_MUL:
        case AArch64_INS_MUL: {
            Handle3Ops(CreateMul);
        } return;
        case AArch64_INS_UMULH: {
            const auto ops = GetOps(3);
            Value *left = rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[1]), rinst.builder->getInt128Ty(), false);
            Value *right = rinst.builder->CreateIntCast(p.PerformShift(rinst, p.GetRegisterView(rinst, ops[2]), shift_type, shift), rinst.builder->getInt128Ty(), false);
            Value *result = rinst.builder->CreateMul(left, right);
            result = rinst.builder->CreateLShr(result, 64);
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateIntCast(result, rinst.builder->getInt64Ty(), false));
        } return;
        case AArch64_INS_SDIV:
        case AArch64_INS_UDIV: {
            const auto ops = GetOps(3);
            Type *type = rinst.GetType(ops[0].size);
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
            // Check if right side is zero
            Value *is_valid = rinst.builder->CreateICmpNE(p.GetRegisterView(rinst, ops[2]), ConstantInt::get(type, 0), "IsValidDiv");
            // Get operands
            Value *left_value = p.GetRegisterView(rinst, ops[1]),
                  *right_value = p.GetRegisterView(rinst, ops[2]);
            // Generate zero as result if right value is zero
            if (!p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreDivByZero)) {
                left_value = rinst.builder->CreateSelect(is_valid, left_value, ConstantInt::get(type, 0));
                right_value = rinst.builder->CreateSelect(is_valid, right_value, ConstantInt::get(type, 1));
            }
            // Do division
            Value *value;
            switch (id) {
            case AArch64_INS_SDIV: value = rinst.builder->CreateSDiv(left_value, right_value); break;
            case AArch64_INS_UDIV: value = rinst.builder->CreateUDiv(left_value, right_value); break;
            }
            // Store final result
            p.StoreRegister(rinst, ops[0], value);
            #endif
        } return;
        case AArch64_INS_ALIAS_SXTB:
        case AArch64_INS_SXTB: extra_flags[byte] = true; [[fallthrough]];
        case AArch64_INS_ALIAS_SXTH:
        case AArch64_INS_SXTH: extra_flags[half_word] = true; [[fallthrough]];
        case AArch64_INS_ALIAS_SXTW:
        case AArch64_INS_SXTW: extra_flags[word] = true; {
            const auto ops = GetOps(2);
            Value *right_value = p.GetRegisterView(rinst, ops[1]);
            Type *source = nullptr;
            if (extra_flags[byte])
                source = rinst.builder->getInt8Ty();
            else if (extra_flags[half_word])
                source = rinst.builder->getInt16Ty();
            else if (extra_flags[word])
                source = rinst.builder->getInt32Ty();
            else
                DYNAUTIC_ASSERT(!"Invalid source width in sign extend");
            right_value = rinst.builder->CreateIntCast(right_value, source, false);
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateIntCast(right_value, rinst.builder->getInt64Ty(), true));
        } return;
        case AArch64_INS_ALIAS_CMN: extra_flags[0] = true; [[fallthrough]];
        case AArch64_INS_ALIAS_CMP: {
            const auto ops = GetOps(2);
            Value *right_value = p.GetRegisterView(rinst, ops[1]);
            if (extra_flags[0])
                right_value = rinst.builder->CreateNot(right_value);
            SetComparison(p.GetRegisterView(rinst, ops[0]), right_value);
        } return;
        case AArch64_INS_ADR: {
            const auto ops = GetOps(2);
            p.StoreRegister(rinst, ops[0], p.GetRegisterView(rinst, ops[1]));
        } return;
        case AArch64_INS_ADRP: {
            const auto ops = GetOps(2);
            p.StoreRegister(rinst, ops[0], p.GetRegisterView(rinst, ops[1]));
        } return;
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
                    CallInst *result = rinst.builder->CreateIntrinsic(rinst.builder->getInt64Ty(), Intrinsic::aarch64_ldxr, {reference});
                    result->addParamAttr(0, Attribute::get(*rinst.context, Attribute::ElementType, rinst.GetType(msiz?msiz:op.size)));
                    p.StoreRegister(rinst, op, result);
                    return;
                } else {
                #endif
                // Tag memory location
                p.CreateExclusiveMonitorTagTrampoline(rinst, reference);
                #ifdef __aarch64__
                }
                #endif
            }

            Value *value = p.CreateMemoryLoad(rinst, reference, rinst.GetType(msiz?msiz:op.size));
            if (msiz)
                value = rinst.builder->CreateIntCast(value, rinst.GetType(op.size), extra_flags[signed_]);
            p.StoreRegister(rinst, op, value);
        } return;
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
                value = rinst.builder->CreateIntCast(value, rinst.GetType(msiz), extra_flags[signed_]);
            p.CreateMemoryStore(rinst, reference, value);
        } return;
        case AArch64_INS_ALIAS_LDPSW:
        case AArch64_INS_LDPSW: {
            const auto ops = GetOps(2);
            Type *type = rinst.GetType(ops[0].size);
            Value *reference = GetMemOpReference(false, 2);
            p.StoreRegister(rinst, ops[0], rinst.builder->CreateIntCast(p.CreateMemoryLoad(rinst, reference, rinst.builder->getInt32Ty()), type, true));
            reference = rinst.builder->CreateAdd(reference, rinst.builder->getInt64(ops[0].size/8));
            p.StoreRegister(rinst, ops[1], rinst.builder->CreateIntCast(p.CreateMemoryLoad(rinst, reference, rinst.builder->getInt32Ty()), type, true));
        } return;
        case AArch64_INS_LDXP: extra_flags[exclusive] = true; [[fallthrough]];
        case AArch64_INS_ALIAS_LDP:
        case AArch64_INS_LDP: {
            const auto ops = GetOps(2);
            Type *type = rinst.GetType(ops[0].size);
            Value *reference = GetMemOpReference(false, 2);

            if (extra_flags[exclusive] && !p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
                #ifdef __aarch64__
                if (p.rt.conf.native_memory) {
                    Type *type = rinst.GetType(ops[0].size);
                    reference = rinst.builder->CreateIntToPtr(reference, rinst.builder->getPtrTy());
                    CallInst *result = rinst.builder->CreateIntrinsic(type, Intrinsic::aarch64_ldxp, {reference});
                    result->addParamAttr(0, Attribute::get(*rinst.context, Attribute::ElementType, type));
                    p.StoreRegister(rinst, ops[0], rinst.builder->CreateExtractValue(result, 0));
                    p.StoreRegister(rinst, ops[1], rinst.builder->CreateExtractValue(result, 1));
                    return;
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
            reference = rinst.builder->CreateAdd(reference, rinst.builder->getInt64(bsiz));
            p.StoreRegister(rinst, ops[1], p.CreateMemoryLoad(rinst, reference, type, alignment));
        } return;
        case AArch64_INS_ALIAS_STP:
        case AArch64_INS_STP: {
            const auto ops = GetOps(2);
            Value *reference = GetMemOpReference(false, 2);
            p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[0]));
            reference = rinst.builder->CreateAdd(reference, rinst.builder->getInt64(ops[0].size/8));
            p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[1]));
        } return;
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
        } return;
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
        } return;
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
                Type *type = rinst.GetType(ops[0].size);
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
        } return;
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
                value = rinst.builder->CreateIntCast(value, rinst.GetType(msiz), extra_flags[signed_]);

            if (!p.rt.conf.HasOptimization(OptimizationFlag::Unsafe_IgnoreGlobalMonitor)) {
                #ifdef __aarch64__
                if (p.rt.conf.native_memory) {
                    reference = rinst.builder->CreateIntToPtr(reference, rinst.builder->getPtrTy());
                    Value *value = rinst.builder->CreateZExt(p.GetRegisterView(rinst, ops[1]), rinst.builder->getInt64Ty());
                    CallInst *result = rinst.builder->CreateIntrinsic(Intrinsic::aarch64_stxr, {rinst.builder->getPtrTy()}, {value, reference});
                    result->addParamAttr(1, Attribute::get(*rinst.context, Attribute::ElementType, rinst.GetType(msiz?msiz:ops[1].size)));
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
                p.StoreRegister(rinst, ops[0], rinst.builder->CreateSelect(poisoned, rinst.builder->getInt32(1), rinst.builder->getInt32(0)));
                #ifdef __aarch64__
                }
                #endif
            } else {
                p.CreateMemoryStore(rinst, reference, value, true);
                p.StoreRegister(rinst, ops[0], rinst.builder->getInt32(0));
            }
        } return;
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
                    CallInst *result = rinst.builder->CreateIntrinsic(rinst.builder->getInt32Ty(), intr, {p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2]), reference});
                    result->addParamAttr(2, Attribute::get(*rinst.context, Attribute::ElementType, rinst.GetType(ops[1].size)));
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
                reference = rinst.builder->CreateAdd(reference, rinst.builder->getInt64(ops[1].size/8));
                p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[2]));
                rinst.builder->CreateBr(continue_branch);
                rinst.UseBasicBlock(continue_branch);
                // Store result in register
                p.StoreRegister(rinst, ops[0], rinst.builder->CreateSelect(poisoned, rinst.builder->getInt32(1), rinst.builder->getInt32(0)));
                #ifdef __aarch64__
                }
                #endif
            } else {
                p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[0]));
                reference = rinst.builder->CreateAdd(reference, rinst.builder->getInt64(ops[0].size/8));
                p.CreateMemoryStore(rinst, reference, p.GetRegisterView(rinst, ops[1]));
            }
        } return;
        // Branch instructions
        case AArch64_INS_BL: {
            // Use BLR implementation if address is immediate
            if (detail.operands[0].type != AArch64_OP_IMM) {
                p.StoreRegister(rinst, "x30", rinst.builder->getInt64(insn.address+4));
                CreateCall(0);
                return;
            }
        } [[fallthrough]];
        case AArch64_INS_BLR: {
            const auto& op = detail.operands[0];
            DYNAUTIC_ASSERT(op.type == AArch64_OP_IMM);
            if (static_cast<VAddr>(op.imm) == insn.address) {
                // Stall forever since this is definitely an infinite loop
                p.CreateDebugPrintTrampoline(rinst, "Infinite loop detected");
                p.CreateFreezeTrampoline(rinst);
                return;
            }
            p.StoreRegister(rinst, "x30", rinst.builder->getInt64(insn.address+4));
            if (static_cast<VAddr>(op.imm) == insn.address+4) {
                // Don't call since target address is next instruction
                return;
            }
            CreateCall(0);
        } return;
        case AArch64_INS_BR:
        case AArch64_INS_B: {
            p.CreateBranch(rinst, PrepareBranch(0));
        } return;
        case AArch64_INS_CBNZ: extra_flags[0] = true; [[fallthrough]];
        case AArch64_INS_CBZ: {
            p.FinalizeBranchContext(rinst);
            const VAddr false_addr = insn.address+4;
            const auto pred = extra_flags[0]?ICmpInst::ICMP_NE:ICmpInst::ICMP_EQ;
            Value *cond = rinst.builder->CreateICmp(pred, rinst.builder->CreateIntCast(p.GetRegisterView(rinst, GetOps(1)[0]), rinst.builder->getInt64Ty(), false), rinst.builder->getInt64(0));
            p.CreateConditionalBranch(rinst, PrepareBranch(1), p.PrepareBranch(rinst, false_addr), cond);
        } return;
        case AArch64_INS_TBNZ: extra_flags[0] = true; [[fallthrough]];
        case AArch64_INS_TBZ: {
            const auto ops = GetOps(2);
            p.FinalizeBranchContext(rinst);
            const VAddr false_addr = insn.address+4;
            Value *value = rinst.builder->CreateAnd(p.GetRegisterView(rinst, ops[0]), rinst.builder->CreateShl(ConstantInt::get(rinst.GetType(ops[0].size), 1), p.GetRegisterView(rinst, ops[1])));
            const auto pred = extra_flags[0]?ICmpInst::ICMP_NE:ICmpInst::ICMP_EQ;
            Value *cond = rinst.builder->CreateICmp(pred, value, ConstantInt::get(rinst.GetType(ops[0].size), 0));
            std::pair<BasicBlock *, BasicBlock *> branches = {PrepareBranch(2), p.PrepareBranch(rinst, false_addr)};
            p.CreateConditionalBranch(rinst, branches.first, branches.second, cond);
        } return;
        case AArch64_INS_ALIAS_RET:
        case AArch64_INS_RET: {
            //TODO: Should do some optimization here in cases where the return address can be determined at compile time
            p.CreateCall(rinst, insn.address, p.GetRegisterView(rinst, "x30"));
        } return;
        // Conditional instruction
        case AArch64_INS_CCMN: extra_flags[0] = true; [[fallthrough]];
        case AArch64_INS_CCMP: {
            const auto ops = GetOps(3);
            Value *imm = rinst.builder->CreateIntCast(p.GetRegisterView(rinst, ops[2]), rinst.builder->getInt8Ty(), false);
            Value *right_value = p.GetRegisterView(rinst, ops[1]);
            Value *condition = GetComparisonCondition();
            if (extra_flags[0])
                right_value = rinst.builder->CreateNot(right_value);
            SetComparison(p.GetRegisterView(rinst, ops[0]), right_value);
            SetNZCVIf(imm, rinst.builder->CreateNot(condition));
        } return;
        case AArch64_INS_ALIAS_CSET: {
            p.StoreRegister(rinst, GetOps(1)[0], GetCondition());
        } return;
        // Miscellaneous
        case AArch64_INS_MRS: {
            const auto dest = GetOps(1)[0];
            const auto src = detail.operands[1];
            DYNAUTIC_ASSERT(src.type == AArch64_OP_SYSREG);
            Value *value = nullptr;
            switch (src.sysop.reg.sysreg) {
            case AArch64_SYSREG_CNTFRQ_EL0: value = rinst.builder->getInt32(rinst.rt.conf.cntfrq_el0); break;
            case AArch64_SYSREG_CTR_EL0: value = rinst.builder->getInt32(rinst.rt.conf.ctr_el0); break;
            case AArch64_SYSREG_DCZID_EL0: value = rinst.builder->getInt32(rinst.rt.conf.dczid_el0); break;
            case AArch64_SYSREG_TPIDRRO_EL0: value = p.CreateLoadFromPtr(rinst, reinterpret_cast<const void *>(rinst.rt.conf.tpidrro_el0), rinst.builder->getInt64Ty()); break;
            case AArch64_SYSREG_TPIDR_EL0: value = p.CreateLoadFromPtr(rinst, reinterpret_cast<const void *>(rinst.rt.conf.tpidr_el0), rinst.builder->getInt64Ty()); break;
            default: {
                DYNAUTIC_ASSERT(!"Unknown MRS access");
                if (rinst.rt.conf.unsafe_unexpected_situation_handling) {
                    value = rinst.builder->getInt64(0);
                } else {
                    p.CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
                    break;
                }
            }
            }
            p.StoreRegister(rinst, dest, value);
        } return;
        case AArch64_INS_ALIAS_NOP:
        case AArch64_INS_HINT: {
            // This is no-op: It does nothing. Nothing to be done here. We don't need it.
        } return;
        case AArch64_INS_SVC: {
            const uint32_t swi = static_cast<uint32_t>(detail.operands[0].imm);
            p.CreateSvcTrampoline(rinst, swi);
        } return;
        case AArch64_INS_ALIAS_WFI: {
            if (rinst.rt.conf.hook_hint_instructions)
                p.CreateExceptionTrampoline(rinst, Exception::WaitForInterrupt);
        } return;
        case AArch64_INS_ALIAS_WFE: {
            if (rinst.rt.conf.hook_hint_instructions)
                p.CreateExceptionTrampoline(rinst, Exception::WaitForEvent);
        } return;
        case AArch64_INS_ALIAS_SEV: {
            if (rinst.rt.conf.hook_hint_instructions)
                p.CreateExceptionTrampoline(rinst, Exception::SendEvent);
        } return;
        case AArch64_INS_ALIAS_SEVL: {
            if (rinst.rt.conf.hook_hint_instructions)
                p.CreateExceptionTrampoline(rinst, Exception::SendEventLocal);
        } return;
        case AArch64_INS_BRK: {
            if (rinst.rt.conf.hook_hint_instructions)
                p.CreateExceptionTrampoline(rinst, Exception::Breakpoint);
        } return;
        case AArch64_INS_ALIAS_YIELD: {
            if (rinst.rt.conf.hook_hint_instructions)
                p.CreateExceptionTrampoline(rinst, Exception::Yield);
        } return;
        case AArch64_INS_UDF:
        default: {
            // Bad/unknown instruction, check if noexec address
            const bool noexec = std::find(noexec_addrs.begin(), noexec_addrs.end(), insn.address) != noexec_addrs.end();
            p.CreateExceptionTrampoline(rinst, noexec?Exception::NoExecuteFault:Exception::UnallocatedEncoding);
            return;
        }
        }
        return;
    }();

    // Switch to next block if not terminated and restore runtime values
    if (next_block) {
        if (!rinst.block_terminated) {
            rinst.builder->CreateBr(next_block);
        }
        rinst.UseBasicBlock(next_block);
        p.rt_values = rt_values_backup;
    }

    return !rinst.block_terminated;
}
}
