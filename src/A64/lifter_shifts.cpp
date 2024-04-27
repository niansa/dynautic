#include "lifter.hpp"
#include "lifter_instance.hpp"
#include "../llvm.hpp"

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
llvm::Value *Lifter::PerformShift(Instance& rinst, llvm::Value *value, aarch64_shifter type, Value *shift) {
    shift = rinst.builder->CreateTrunc(shift, value->getType());
    switch (type) {
    case AArch64_SFT_INVALID: return value;
    case AArch64_SFT_LSL: return rinst.builder->CreateShl(value, shift);
    case AArch64_SFT_MSL: return rinst.builder->CreateSub(rinst.builder->CreateShl(shift, value), shift); // TODO: Verify
    case AArch64_SFT_LSR: return rinst.builder->CreateLShr(value, shift);
    case AArch64_SFT_ASR: return rinst.builder->CreateAShr(value, shift);
    case AArch64_SFT_ROR: return rinst.builder->CreateOr(rinst.builder->CreateLShr(value, shift), rinst.builder->CreateShl(value, rinst.builder->CreateSub(ConstantInt::get(value->getType(), value->getType()->getIntegerBitWidth()), shift)));
    default: DYNAUTIC_ASSERT(!"Invalid shift operation");
    }
}
llvm::Value *Lifter::PerformShift(Instance& rinst, llvm::Value *value, aarch64_shifter type, uint8_t shift) {
    return PerformShift(rinst, value, type, rinst.builder->getInt64(shift));
}

uint64_t Lifter::PerformShift(uint64_t value, uint8_t bits, aarch64_shifter type, uint8_t shift) {
    switch (type) {
    case AArch64_SFT_INVALID: return value;
    case AArch64_SFT_LSL: return value << shift;
    case AArch64_SFT_MSL: return (shift << value) - shift; // TODO: Verify
    case AArch64_SFT_LSR: return value >> shift;
    case AArch64_SFT_ASR: {
        const int64_t immediate = *reinterpret_cast<int64_t*>(&value) >> shift;
        return *reinterpret_cast<const uint64_t*>(&immediate);
    }
    case AArch64_SFT_ROR: return (value >> shift) | (value << (bits - shift));
    default: DYNAUTIC_ASSERT(!"Invalid shift operation");
    }
}
}
