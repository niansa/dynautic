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
        Value *value = Constant::getNullValue(type);
        const auto imm = p.PerformShift(immop.imm, static_cast<uint8_t>(elem_type->getIntegerBitWidth()), shift_type, shift);
        value = rinst.builder->CreateInsertElement(value, ConstantInt::get(elem_type, imm), 0ul);
        static const int mask[64] = {};
        value = rinst.builder->CreateShuffleVector(value, ArrayRef<int>(mask, op.elements));
        p.StoreRegister(rinst, op, value);
    } return true;
    }

    // We couldn't handle this instruction
    return false;
}
}
