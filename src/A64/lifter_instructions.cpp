#include "lifter.hpp"
#include "lifter_instructions.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "../llvm.hpp"

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

void Lifter::InstructionLifter::DeferCompilation(bool repeat_instruction) {
    // Below function terminates the block
    p.CreateLiftTrampoline(rinst, insn.address, rinst.builder->getInt64(insn.address+(repeat_instruction?0:4)));
}

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

    // Get instruction id
    const uint64_t id = insn.is_alias ? insn.alias_id : insn.id;

    // Big switch table for all instructions we need to handle
    if (!BaseInstructions(id)) {
        const bool noexec = std::find(noexec_addrs.begin(), noexec_addrs.end(), insn.address) != noexec_addrs.end();
        p.CreateExceptionTrampoline(rinst, noexec?Exception::NoExecuteFault:Exception::UnallocatedEncoding);
    }

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
