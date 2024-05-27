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


namespace Dynautic::A64 {
bool Lifter::InstructionLifter::VectorInstructions(uint64_t id) {
    // Base instructions
    switch (id) {
    case AArch64_INS_MOVI: {
        const auto op = GetOps(2)[0];
        const auto immop = detail.operands[1];
        DYNAUTIC_ASSERT(immop.type == AArch64_OP_IMM);
        DYNAUTIC_ASSERT(op.type == RegisterDescription::Type::vector);
        VectorType *type = reinterpret_cast<VectorType*>(rinst.GetRegType(op));
        Type *elem_type = type->getElementType();
        const auto imm = p.PerformShift(immop.imm, static_cast<uint8_t>(elem_type->getIntegerBitWidth()), shift_type, shift);
        p.StoreRegister(rinst, op, ConstantInt::get(type, imm));
    } return true;
    case AArch64_INS_CMGT: { // Untested...
        const auto ops = GetOps(3);
        DYNAUTIC_ASSERT(ops[0].type == RegisterDescription::Type::vector);
        Value *value = rinst.builder->CreateCmp(CmpInst::ICMP_SGT, p.GetRegisterView(rinst, ops[1]), p.GetRegisterView(rinst, ops[2]));
        value = rinst.builder->CreateSExt(value, rinst.GetRegType(ops[0]));
        p.StoreRegister(rinst, ops[0], value);
    } return true;
    case AArch64_INS_ADDV: {
        const auto ops = GetOps(2);
        DYNAUTIC_ASSERT(ops[0].size == ops[1].size);
        Value *value = p.GetRegisterView(rinst, ops[1]);
        value = rinst.builder->CreateIntrinsic(rinst.GetRegType(ops[0]), Intrinsic::vector_reduce_add, value);
        p.StoreRegister(rinst, ops[0], value);
    } return true;
    }

    // We couldn't handle this instruction
    return false;
}
}
