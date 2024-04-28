#include "lifter.hpp"
#include "lifter_instance.hpp"
#include "runtime.hpp"
#include "../llvm.hpp"

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
RegisterDescription::RegisterDescription(const char *name) {
    if (std::string_view(name) == "sp") {
        type = Type::stack_pointer;
        integer = true;
        idx = 0;
        return;
    }

    switch (name[0]) {
    case 'w': isWord = true; [[fallthrough]];
    case 'r': [[fallthrough]];
    case 'x': type = Type::general; integer = true; break;
    }

    switch (type) {
    case Type::general: {
        // Remove letter
        ++name;
        // Check for zr
        if (std::string_view(name) == "zr") {
            idx = -1;
            return;
        }
        // Convert to integer
        idx = static_cast<int>(std::stoul(name));
    } break;
    default: DYNAUTIC_ASSERT(!"Unsupported register type");
    }
}

RegisterDescription::RegisterDescription(csh handle, aarch64_reg reg)
    : RegisterDescription(reg==AArch64_REG_INVALID?"xzr":cs_reg_name(handle, reg)) {}

std::string RegisterDescription::GetName() const {
    std::string fres;

    // Get prefix
    switch (type) {
    case Type::general: {
        fres.push_back(isWord?'w':'x');
    } break;
    case Type::scratch: {
        fres.append(isWord?"scratch32_":"scratch64_");
    } break;
    case Type::stack_pointer: return "sp_";
    default: DYNAUTIC_ASSERT(!"Unsupported register type");
    }

    // Get index
    if (idx >= 0)
        fres.append(std::to_string(idx));
    else
        fres.append("zr");

    fres.push_back('_');
    return fres;
}


void Lifter::ResetScratchRegisters() {
    rt_values.scratch_registers.fill(nullptr);
}

RegisterDescription Lifter::AllocateScratchRegister(bool as_word) {
    for (unsigned idx = 0; idx != rt_values.scratch_registers.size(); ++idx)
        if (!rt_values.scratch_registers[idx])
            return {idx, as_word};

    DYNAUTIC_ASSERT(!"Out of scratch registers");
}

Value *&Lifter::GetRawRegister(RegisterDescription desc, bool allow_store_to) {
    switch (desc.type) {
    case RegisterDescription::Type::scratch: return rt_values.scratch_registers[desc.idx];
    case RegisterDescription::Type::general: {
        if (allow_store_to)
            rt_values.dirty_registers[desc.idx] = true;
        return rt_values.registers[desc.idx];
    } break;
    case RegisterDescription::Type::stack_pointer: {
        if (allow_store_to)
            rt_values.dirty_stack_pointer = true;
        return rt_values.stack_pointer;
    }
    default: {
        DYNAUTIC_ASSERT(!"Unsupported register type");
        // We create a null pointer instead, hoping it's not going to be used
        static Value *invalid_value;
        invalid_value = nullptr;
        return invalid_value;
    }
    }
}

Value *Lifter::GetRegisterView(Instance& rinst, RegisterDescription desc) {
    if (desc.type == RegisterDescription::Type::invalid)
        goto invalid;

    if (desc.integer) {
        // Handle zero register
        if (desc.IsZero())
            return desc.isWord?rinst.builder->getInt32(0):rinst.builder->getInt64(0);
        // Get real register from list
        Value *fres = GetRawRegister(desc, false);
        // Truncate to 32 bit as needed
        if (desc.isWord) {
            fres = rinst.builder->CreateTrunc(fres, rinst.builder->getInt32Ty());
        }
        return fres;
    }

    invalid:
    DYNAUTIC_ASSERT(!"Unsupported register type");
    if (rt.conf.unsafe_unexpected_situation_handling)
        return rinst.builder->getInt32(0);
    else
        CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
}

Value *Lifter::StoreRegister(Instance& rinst, RegisterDescription desc, llvm::Value *value, aarch64_shifter shift_type, uint8_t shift) {
    if (desc.type == RegisterDescription::Type::invalid)
        goto invalid;

    if (desc.integer) {
        // Get real register from list
        Value *&fres = GetRawRegister(desc, true);
        // Apply shift to value
        value = PerformShift(rinst, value, shift_type, shift);
        // Set value after casting to 64bit
        fres = rinst.builder->CreateIntCast(value, rinst.builder->getInt64Ty(), false, desc.GetName());
        return fres;
    }

invalid:
    DYNAUTIC_ASSERT(!"Unsupported register type");
    if (rt.conf.unsafe_unexpected_situation_handling)
        return rinst.builder->getInt32(0);
    else
        CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
}

Value *Lifter::StoreRegister16(Instance& rinst, RegisterDescription desc, uint16_t value, bool keep, aarch64_shifter shift_type, uint8_t shift) {
    if (desc.integer) {
        Value *&fres = GetRawRegister(desc, true);
        const uint8_t bits = desc.isWord?32:64;
        if (keep) {
            // Mask out existing bits
            Value *mask = rinst.builder->getInt64(~(PerformShift(0xffff, bits, shift_type, shift)));
            fres = rinst.builder->CreateAnd(fres, mask);
            // Merge shifted value into result
            fres = rinst.builder->CreateOr(fres, PerformShift(value, bits, shift_type, shift));
            // Strip first 32bits if needed
            if (desc.isWord)
                fres = rinst.builder->CreateAnd(fres, 0xffffffff);
        } else {
            fres = rinst.builder->getInt64(PerformShift(value, bits, shift_type, shift));
        }
        fres->setName(desc.GetName());
        return fres;
    }

    DYNAUTIC_ASSERT(!"Unsupported register type");
}
}
