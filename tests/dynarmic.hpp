#ifndef Dynarmic_HPP
#define Dynarmic_HPP
#include "common.hpp"

#include <stdexcept>
#include <cstring>
#include <sys/mman.h>
#include <dynarmic/interface/A64/a64.h>
#include <dynarmic/interface/A64/config.h>



class DynarmicEnv final : public Dynarmic::A64::UserCallbacks {
public:
    using u128 = Dynarmic::A64::Vector;

    Dynarmic::A64::Jit *cpu;

    u64 ticks_left = 10000;
    std::array<u8, TestBase::mem_size> memory{};

    u8 MemoryRead8(u64 vaddr) override {
        if (vaddr >= memory.size()) {
            cpu->HaltExecution(Dynarmic::HaltReason::MemoryAbort);
            return 0;
        }
        return memory[vaddr];
    }

    u16 MemoryRead16(u64 vaddr) override {
        return u16(MemoryRead8(vaddr)) | u16(MemoryRead8(vaddr + 1)) << 8;
    }

    u32 MemoryRead32(u64 vaddr) override {
        return u32(MemoryRead16(vaddr)) | u32(MemoryRead16(vaddr + 2)) << 16;
    }

    u64 MemoryRead64(u64 vaddr) override {
        return u64(MemoryRead32(vaddr)) | u64(MemoryRead32(vaddr + 4)) << 32;
    }

    u128 MemoryRead128(u64 vaddr) override {
        return {MemoryRead64(vaddr), MemoryRead64(vaddr + 8)};
    }

    void MemoryWrite8(u64 vaddr, u8 value) override {
        if (vaddr >= memory.size()) {
            cpu->HaltExecution(Dynarmic::HaltReason::MemoryAbort);
            return;
        }
        memory[vaddr] = value;
    }

    void MemoryWrite16(u64 vaddr, u16 value) override {
        MemoryWrite8(vaddr, u8(value));
        MemoryWrite8(vaddr + 1, u8(value >> 8));
    }

    void MemoryWrite32(u64 vaddr, u32 value) override {
        MemoryWrite16(vaddr, u16(value));
        MemoryWrite16(vaddr + 2, u16(value >> 16));
    }

    void MemoryWrite64(u64 vaddr, u64 value) override {
        MemoryWrite32(vaddr, u32(value));
        MemoryWrite32(vaddr + 4, u32(value >> 32));
    }

    void MemoryWrite128(u64 vaddr, u128 value) override {
        MemoryWrite64(vaddr, value[0]);
        MemoryWrite64(vaddr+8, value[1]);
    }

    void InterpreterFallback(u64 pc, size_t num_instructions) override {
        // This is never called in practice.
        std::terminate();
    }

    void CallSVC(u32 swi) override {
        if (swi == 4) {
            cpu->HaltExecution(Dynarmic::HaltReason::UserDefined4);
        } else if (swi == 6) {
            std::cout << "General purpose registers:\n";
            for (unsigned idx = 0; idx != 31; idx++) {
                std::cout << std::dec << " - [x" << idx << "] 0x" << std::hex << cpu->GetRegister(idx) << '\n';
            }
            std::cout << "\nMisc registers:\n"
                         " - [sp] 0x" << std::hex << cpu->GetSP() << "\n"
                         " - [pc] 0x" << std::hex << cpu->GetPC() << "\n\n";
        } else {
            cpu->HaltExecution(Dynarmic::HaltReason::UserDefined1);
        }
    }

    void ExceptionRaised(u64 pc, ::Dynarmic::A64::Exception exception) override {
        std::cerr << "Dynarmic error: Exception raised at " << reinterpret_cast<void*>(pc) << ": " << static_cast<unsigned>(exception) << std::endl;
        if (exception == Dynarmic::A64::Exception::UnallocatedEncoding || exception == Dynarmic::A64::Exception::UnpredictableInstruction)
            cpu->HaltExecution(Dynarmic::HaltReason::UserDefined3);
        else
            cpu->HaltExecution(Dynarmic::HaltReason::UserDefined7);
    }

    void AddTicks(u64 ticks) override {
        if (ticks > ticks_left) {
            ticks_left = 0;
            return;
        }
        ticks_left -= ticks;
    }

    u64 GetTicksRemaining() override {
        return ticks_left;
    }

    std::uint64_t GetCNTPCT() override {
        return 0;
    }
};


class TestDynarmic final : public TestBase {
    DynarmicEnv env;
    Dynarmic::A64::UserConfig user_config;

public:
    TestDynarmic() {
        user_config.callbacks = &env;
        user_config.check_halt_on_memory_access = false;
        mmap(reinterpret_cast<void*>(exe_base), 1024*1024/*1 MB*/, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    }

    uint64_t RunTest(std::vector<u32>&& instructions, std::array<u8, TestBase::mem_size>& memory, bool no_native_memory) override {
        (void)no_native_memory;

        u64 fres;
        std::vector<u64> cache;
        env.memory.fill(0);

        // Create runtime
        Dynarmic::A64::Jit cpu(user_config);
        env.cpu = &cpu;

        // Write exit SVC instruction
        env.MemoryWrite32(exit_addr, 0xd4000081); // svc #4
        env.MemoryWrite32(exit_addr+4, 0xd65f03c0); // ret

        // Copy instructions to memory
        for (unsigned addr = exe_base, idx = 0; idx != instructions.size(); addr += 4, ++idx) {
            env.MemoryWrite32(addr, instructions[idx]);
        }
        // Set up heap and stack
        Dynarmic::A64::VAddr stack_addr = this->stack_addr;
        Dynarmic::A64::VAddr heap_base = this->heap_base;
        // Set up registers
        cpu.SetRegister(0, 0xfabd3dd59df77212);
        cpu.SetRegister(1, 0xabcdfea1);
        cpu.SetRegister(2, 0x0);
        cpu.SetRegister(10, heap_base);
        cpu.SetRegister(23, exit_addr);
        cpu.SetRegister(24, exe_base);
        cpu.SetRegister(30, exit_addr);
        cpu.SetSP(stack_addr);
        cpu.SetPC(exe_base);

        // Execute
        common::Timer timer;
        restart:
        env.ticks_left = 10000;
        const auto halt_reason = cpu.Run();
        if (timer.get() > 180000) {
            std::cout << "Dynarmic timed out after 3 minutes." << std::endl;
            return fres;
        }
        switch (halt_reason) {
        case static_cast<Dynarmic::HaltReason>(0): goto restart;
        case Dynarmic::HaltReason::UserDefined4: break;
        case Dynarmic::HaltReason::UserDefined3: cpu.SetPC(cpu.GetPC()+4); goto restart;
        default: throw std::runtime_error("Dynarmic error: Unexpected halt reasons: "+std::to_string(static_cast<uint32_t>(halt_reason)));
        }
        const auto duration = timer.get();

        // Get result
        fres = cpu.GetRegister(0);
        memory = env.memory;

        std::cout << "Dynarmic done after " << std::dec << duration << "ms!" << std::endl;
        return fres;
    }
};

#endif // Dynarmic_HPP
