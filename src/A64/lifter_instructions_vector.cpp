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
        //
    } return true;
    }

    // We couldn't handle this instruction
    return false;
}
}
