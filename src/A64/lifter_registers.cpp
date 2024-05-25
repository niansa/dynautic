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
    case 's': size = Size::single; type = Type::scalar; break;
    case 'd': size = Size::double_; type = Type::scalar; break;
    case 'q': size = Size::quad; type = Type::scalar; break;
    case 'v': type = Type::vector; break;
    }

    switch (type) {
    case Type::general:
    case Type::scalar: {
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
    case Type::vector: {
        // Remove letter
        ++name;
        // Convert to integer
        idx = static_cast<int>(std::stoul(name));
        // Skip past .
        while (*(name++) != '.');
        // Convert to integer
        elements = static_cast<uint8_t>(std::stoul(name));
        // Skip past number
        while (std::isdigit(*(name++)));
        // Determine size
        switch (name[0]) {
        case 'b': size = Size::byte; break;
        case 'h': size = Size::half; break;
        case 's': size = Size::single; break;
        case 'd': size = Size::double_; break;
        case 'q': size = Size::quad; break;
        }
    }
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
    case Type::scalar: {
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

TypeSize Lifter::GetTypeSizeInBits(Instance& rinst, Type *type) {
    return rinst.module->getDataLayout().getTypeSizeInBits(type);
}

Value *&Lifter::GetRawRegister(RegisterDescription desc, bool allow_overwrite) {
    DYNAUTIC_ASSERT(!desc.IsZero());

    switch (desc.type) {
    case RegisterDescription::Type::scratch: return rt_values.scratch_registers[desc.idx];
    case RegisterDescription::Type::general: {
        if (allow_overwrite)
            rt_values.dirty_registers[desc.idx] = true;
        return rt_values.registers[desc.idx];
    } break;
    case RegisterDescription::Type::scalar: {
        if (allow_overwrite)
            rt_values.dirty_vectors[desc.idx] = true;
        return rt_values.vectors[desc.idx];
    } break;
    case RegisterDescription::Type::stack_pointer: {
        if (allow_overwrite)
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

Value *Lifter::GetRegisterView(Instance& rinst, RegisterDescription desc, Type *as_type) {
    if (desc.type == RegisterDescription::Type::invalid) {
        DYNAUTIC_ASSERT(!"Invalid register type");
        if (rt.conf.unsafe_unexpected_situation_handling)
            return rinst.CreateInt(32, 0);
        else
            CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
    }

    // Handle zero register
    if (desc.IsZero())
        return ConstantInt::get(rinst.GetType(desc.size), 0);
    // Get real register from list
    Value *fres = GetRawRegister(desc, false);
    // Truncate as needed
    Type *current_type = fres->getType();
    if (current_type != as_type) {
        const auto current_type_size = GetTypeSizeInBits(rinst, current_type);
        const auto requested_type_size = GetTypeSizeInBits(rinst, as_type);
        DYNAUTIC_ASSERT(current_type_size >= requested_type_size);

        if (requested_type_size < current_type_size) {
            auto new_width = static_cast<unsigned>(requested_type_size);
            if (current_type->isVectorTy() && !as_type->isVectorTy())
                new_width /= (current_type_size / current_type->getScalarSizeInBits());
            current_type = current_type->getWithNewBitWidth(new_width);
            fres = rinst.builder->CreateTrunc(fres, current_type);
        }
    }
    // Bitcast as neded
    if (current_type != as_type)
        fres = rinst.builder->CreateBitCast(fres, as_type);

    return fres;
}

Value *Lifter::GetRegisterView(Instance& rinst, RegisterDescription desc, bool allow_vector) {
    return GetRegisterView(rinst, desc, rinst.GetType(desc.size, allow_vector));
}

Value *Lifter::StoreRegister(Instance& rinst, RegisterDescription desc, llvm::Value *value, aarch64_shifter shift_type, uint8_t shift) {
    if (desc.type == RegisterDescription::Type::invalid) {
        DYNAUTIC_ASSERT(!"Invalid register type");
        if (rt.conf.unsafe_unexpected_situation_handling)
            return rinst.CreateInt(32, 0);
        else
            CreateExceptionTrampoline(rinst, Exception::UnpredictableInstruction);
    }

    // Handle zero register
    if (desc.IsZero())
        return ConstantInt::get(rinst.GetType(desc.size), 0);
    // Get real register from list
    Value *&fres = GetRawRegister(desc, true);
    // Apply shift to value
    value = PerformShift(rinst, value, shift_type, shift);
    // Extend as needed
    Type *reg_type = fres->getType();
    Type *current_type = value->getType();
    if (current_type != reg_type) {
        const auto current_type_size = GetTypeSizeInBits(rinst, current_type);
        const auto reg_type_size = GetTypeSizeInBits(rinst, reg_type);
        DYNAUTIC_ASSERT(reg_type_size >= current_type_size);

        if (reg_type_size > current_type_size) {
            auto new_width = static_cast<unsigned>(reg_type_size);
            if (current_type->isVectorTy() && !reg_type->isVectorTy())
                new_width *= (reg_type_size / reg_type->getScalarSizeInBits());
            current_type = current_type->getWithNewBitWidth(new_width);
            value = rinst.builder->CreateZExt(value, current_type);
        }
    }
    // Bitcast as needed
    if (current_type != reg_type)
        value = rinst.builder->CreateBitCast(value, reg_type);
    // Set register
    fres = value;

    return fres;
}

Value *Lifter::StoreRegister16(Instance& rinst, RegisterDescription desc, uint16_t value, bool keep, aarch64_shifter shift_type, uint8_t shift) {
    DYNAUTIC_ASSERT(desc.size != RegisterDescription::Size::quad);

    // Handle zero register
    if (desc.IsZero())
        return ConstantInt::get(rinst.GetType(desc.size), 0);
    // Get real register from list
    Value *&fres = GetRawRegister(desc, true);
    if (keep) {
        // Mask out existing bits
        Value *mask = rinst.CreateInt(64, ~(PerformShift(0xffff, desc.size, shift_type, shift)));
        fres = rinst.builder->CreateAnd(fres, mask);
        // Merge shifted value into result
        fres = rinst.builder->CreateOr(fres, PerformShift(value, desc.size, shift_type, shift));
        // Strip first 32bits if needed
        if (desc.size == RegisterDescription::word)
            fres = rinst.builder->CreateAnd(fres, 0xffffffff);
    } else {
        fres = rinst.CreateInt(64, PerformShift(value, desc.size, shift_type, shift));
    }
    fres->setName(desc.GetName());
    return fres;
}
}
