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
        idx = 0;
        return;
    }

    switch (name[0]) {
    case 'w': size = Size::word; type = Type::general; break;
    case 'r': [[fallthrough]];
    case 'x': size = Size::double_word; type = Type::general; break;
    case 's': size = Size::single; type = Type::vector; break;
    case 'd': size = Size::double_; type = Type::vector; break;
    case 'q': size = Size::quad; type = Type::vector; break;
    }

    switch (type) {
    case Type::general:
    case Type::vector: {
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
        switch (size) {
        case word: fres.push_back('w'); break;
        case double_word: fres.push_back('x'); break;
        }
    } break;
    case Type::vector: {
        switch (size) {
        case single: fres.push_back('s'); break;
        case double_: fres.push_back('d'); break;
        case quad: fres.push_back('q'); break;
        }
    } break;
    case Type::scratch: {
        fres.append((size==Size::word)?"scratch32_":"scratch64_");
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
    return "xzr";
}

Value *Lifter::GetRawRegister(RegisterDescription desc) {
    DYNAUTIC_ASSERT(!desc.IsZero());

    switch (desc.type) {
    case RegisterDescription::Type::scratch: return rt_values.scratch_registers[desc.idx];
    case RegisterDescription::Type::general: return rt_values.registers[desc.idx];
    case RegisterDescription::Type::vector: return rt_values.vectors[desc.idx];
    case RegisterDescription::Type::stack_pointer: return rt_values.stack_pointer;
    default: {
        DYNAUTIC_ASSERT(!"Unsupported register type");
        // We create a null pointer instead, hoping it's not going to be used
        static Value *invalid_value;
        invalid_value = nullptr;
        return invalid_value;
    }
    }
}

llvm::Value *&Lifter::GetRawScratchRegister(RegisterDescription desc) {
    DYNAUTIC_ASSERT(desc.type == RegisterDescription::Type::scratch);
    return rt_values.scratch_registers[desc.idx];
}

Value *Lifter::GetRegisterView(Instance& rinst, RegisterDescription desc) {
    if (desc.type == RegisterDescription::Type::invalid) {
        DYNAUTIC_ASSERT(!"Invalid register type");
        if (rt.conf.unsafe_unexpected_situation_handling)
            return rinst.builder->getInt32(0);
        else
            CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
    }

    // Handle zero register
    if (desc.IsZero())
        return ConstantInt::get(rinst.GetType(desc.size), 0);
    // Load from register
    Value *fres;
    if (desc.type != RegisterDescription::Type::scratch)
        fres = rinst.builder->CreateLoad(rinst.GetType(desc.size), GetRawRegister(desc));
    else
        fres = GetRawScratchRegister(desc);
    // Truncate as needed
    return rinst.builder->CreateTrunc(fres, rinst.GetType(desc.size));
}

Value *Lifter::StoreRegister(Instance& rinst, RegisterDescription desc, llvm::Value *value, aarch64_shifter shift_type, uint8_t shift) {
    if (desc.type == RegisterDescription::Type::invalid) {
        DYNAUTIC_ASSERT(!"Invalid register type");
        if (rt.conf.unsafe_unexpected_situation_handling)
            return rinst.builder->getInt32(0);
        else
            CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
    }

    // Handle zero register
    if (desc.IsZero())
        return ConstantInt::get(rinst.GetType(desc.size), 0);
    // Apply shift to value
    value = PerformShift(rinst, value, shift_type, shift);
    // Cast to full size
    value = rinst.builder->CreateIntCast(value, rinst.GetType(desc.GetFullTypeSize()), false, desc.GetName());
    // Store to register
    if (desc.type != RegisterDescription::Type::scratch)
        rinst.builder->CreateStore(value, GetRawRegister(desc));
    else
        GetRawScratchRegister(desc) = value;
    return value;
}

Value *Lifter::StoreRegister16(Instance& rinst, RegisterDescription desc, uint16_t value, bool keep, aarch64_shifter shift_type, uint8_t shift) {
    DYNAUTIC_ASSERT(desc.size != RegisterDescription::Size::quad);
    DYNAUTIC_ASSERT(desc.type != RegisterDescription::Type::scratch);

    // Get data type
    Type *type = rinst.GetType(desc.size);
    // Handle zero register
    if (desc.IsZero())
        return ConstantInt::get(type, 0);
    // Get register
    Value *reg = GetRawRegister(desc);
    Value *fres;
    if (keep) {
        // Get full data type
        Type *full_type = rinst.GetType(desc.GetFullTypeSize());
        // Load register value
        fres = rinst.builder->CreateLoad(full_type, reg);
        // Mask out existing bits
        Value *mask = ConstantInt::get(full_type, ~(PerformShift(0xffff, desc.size, shift_type, shift)));
        fres = rinst.builder->CreateAnd(fres, mask);
        // Merge shifted value into result
        fres = rinst.builder->CreateOr(fres, PerformShift(value, desc.size, shift_type, shift));
        // Strip first 32bits if needed
        if (desc.size == RegisterDescription::word)
            fres = rinst.builder->CreateAnd(fres, 0xffffffff);
    } else {
        fres = rinst.builder->getInt64(PerformShift(value, desc.size, shift_type, shift));
    }
    // Store back value
    rinst.builder->CreateStore(fres, reg);
    fres->setName(desc.GetName());
    return fres;
}
}
