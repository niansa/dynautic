#ifndef DYNAUTIC_HPP
#define DYNAUTIC_HPP
#include "common.hpp"

#include <stdexcept>
#include <cstring>
#include <sys/mman.h>
#include <dynautic/A64.hpp>



class DynauticEnv final : public Dynautic::A64::UserCallbacks {
public:
    using u128 = Dynautic::A64::Vector;

    Dynautic::A64::Runtime *cpu;

    u64 ticks_left = 0;
    std::array<u8, TestBase::mem_size> memory{};

    u8 MemoryRead8(u64 vaddr) override {
        if (vaddr >= memory.size()) {
            cpu->HaltExecution(Dynautic::HaltReason::MemoryAbort);
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
            cpu->HaltExecution(Dynautic::HaltReason::MemoryAbort);
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
            cpu->HaltExecution(Dynautic::HaltReason::UserDefined4);
        } else if (swi == 6) {
            std::cout << "General purpose registers:\n";
            for (unsigned idx = 0; idx != 31; idx++) {
                std::cout << std::dec << " - [x" << idx << "] 0x" << std::hex << cpu->GetRegister(idx) << '\n';
            }
            std::cout << "\nMisc registers:\n"
                         " - [sp] 0x" << std::hex << cpu->GetSP() << "\n"
                         " - [pc] 0x" << std::hex << cpu->GetPC() << "\n\n";
        } else {
            cpu->HaltExecution(Dynautic::HaltReason::UserDefined1);
        }
    }

    void ExceptionRaised(u64 pc, ::Dynautic::A64::Exception exception) override {
        std::cerr << "Dynautic error: Exception raised at " << reinterpret_cast<void*>(pc) << ": " << static_cast<unsigned>(exception) << std::endl;
        if (exception == Dynautic::A64::Exception::UnallocatedEncoding || exception == Dynautic::A64::Exception::UnpredictableInstruction)
            cpu->HaltExecution(Dynautic::HaltReason::UserDefined3);
        else
            cpu->HaltExecution(Dynautic::HaltReason::UserDefined7);
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


class TestDynautic final : public TestBase {
    DynauticEnv env;
    Dynautic::A64::UserConfig user_config;

public:
    TestDynautic() {
        user_config.callbacks = &env;
        // user_config.llvm_opt_level = Dynautic::LLVMOptimizationLevel::O0;
        mmap(reinterpret_cast<void*>(exe_base), 1024*1024/*1 MB*/, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE, -1, 0);
    }

    void updateConfig(unsigned run) {
        switch (run) {
        case 0: {
            user_config.update_cache = false;
            user_config.fully_static = false;
            user_config.periodic_recompile = 0;
            user_config.native_memory = false;
            user_config.unsafe_optimizations = false;
        } break;
        case 1: {
            user_config.update_cache = true;
            user_config.fully_static = false;
            user_config.periodic_recompile = 100;
            user_config.native_memory = false;
            user_config.unsafe_optimizations = false;
        } break;
        case 2: {
            user_config.update_cache = false;
            user_config.fully_static = true;
            user_config.periodic_recompile = 0;
            user_config.native_memory = false;
            user_config.unsafe_optimizations = true;
        } break;
        case 3: {
            user_config.update_cache = false;
            user_config.fully_static = true;
            user_config.periodic_recompile = 0;
            user_config.native_memory = true;
            user_config.unsafe_optimizations = true;
        } break;
        }
    }

    uint64_t RunTest(std::vector<u32>&& instructions, std::array<u8, TestBase::mem_size>& memory, bool no_native_memory) override {
        u64 fres;
        std::vector<u64> cache;

        // Run twice to test caching
        for (unsigned run = 0; run != (no_native_memory ? 3 : 4); ++run) {
            env.memory.fill(0);

            // Configure
            updateConfig(run);
            // user_config.dump_assembly = true;

            // Create runtime
            Dynautic::A64::Runtime cpu(user_config);
            env.cpu = &cpu;

            // Restore
            if (!cache.empty() && user_config.use_cache) {
                cpu.LoadCache(cache);
                std::cout << "Using " << cache.size() << " bytes of cache data for next pass." << std::endl;
            }

            // Write exit SVC instruction
            env.MemoryWrite32(exit_addr, 0xd4000081);     // svc #4
            env.MemoryWrite32(exit_addr + 4, 0xd65f03c0); // ret

            // Copy instructions to memory
            for (unsigned addr = exe_base, idx = 0; idx != instructions.size(); addr += 4, ++idx) {
                env.MemoryWrite32(addr, instructions[idx]);
            }
            if (user_config.native_memory)
                memcpy(reinterpret_cast<void *>(exe_base), instructions.data(), instructions.size() * 4);

            // Set up heap and stack
            Dynautic::A64::VAddr stack_addr = this->stack_addr;
            Dynautic::A64::VAddr heap_base = this->heap_base;
            if (user_config.native_memory) {
                stack_addr = reinterpret_cast<Dynautic::A64::VAddr>(&env.memory[stack_addr]);
                heap_base = reinterpret_cast<Dynautic::A64::VAddr>(&env.memory[heap_base]);
            }

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
            const auto halt_reason = cpu.Run();
            switch (halt_reason) {
            case Dynautic::HaltReason::UserDefined4:
                break;
            case Dynautic::HaltReason::UserDefined3:
                throw std::runtime_error("Bad instruction encountered at " + std::to_string(cpu.GetPC()));
            case Dynautic::HaltReason::JITInvalidation:
                std::cout << "Reoptimizing with " << cpu.DumpCache().size() << " bytes of cache data\n";
                goto restart;
            default:
                throw std::runtime_error("Dynautic error: Unexpected halt reasons (" + std::to_string(static_cast<uint32_t>(halt_reason)) + ") at " +
                                         std::to_string(cpu.GetPC()));
            }
            const auto duration = timer.get();

            // Save cache
            auto newCache = cpu.DumpCache();
            if (newCache.size() > cache.size())
                cache = std::move(newCache);

            // Get result
            if (run == 0)
                fres = cpu.GetRegister(0);
            else if (fres != cpu.GetRegister(0))
                fres = 0xcac3bad;
            if (!user_config.native_memory)
                memory = env.memory;

            std::cout << "Dynautic pass #" << std::dec << run << " done after " << duration << "ms!" << std::endl;
        }

        std::cout << "Dynautic done!" << std::endl;
        return fres;
    }
};

#endif // DYNAUTIC_HPP
