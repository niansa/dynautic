#ifndef DYNAUTIC_HPP
#define DYNAUTIC_HPP
#include "common.hpp"

#include <stdexcept>
#include <dynautic/A64.hpp>



class MyEnvironment final : public Dynautic::A64::UserCallbacks {
public:
    using u128 = Dynautic::A64::Vector;

    Dynautic::A64::Runtime *cpu;

    u64 ticks_left = 0;

    std::optional<std::uint32_t> MemoryReadCode(Dynautic::A64::VAddr vaddr) override {
        switch (vaddr) {
        case TestBase::exit_addr + 0: return 0xd4000081; // svc #4
        case TestBase::exit_addr + 4: return 0xd65f03c0; // ret
        default: {
            if (vaddr > TestBase::exit_addr && vaddr < TestBase::exit_addr + 0x10000)
                return {};
            return *reinterpret_cast<u32*>(vaddr);
        };
        }
    }

    u8 MemoryRead8(Dynautic::A64::VAddr) override {return {};}
    u16 MemoryRead16(Dynautic::A64::VAddr) override {return {};}
    u32 MemoryRead32(Dynautic::A64::VAddr) override {return {};}
    u64 MemoryRead64(Dynautic::A64::VAddr) override {return {};}
    Dynautic::A64::Vector MemoryRead128(Dynautic::A64::VAddr) override {return {};}

    void MemoryWrite8(Dynautic::A64::VAddr, u8 ) override {}
    void MemoryWrite16(Dynautic::A64::VAddr, u16) override {}
    void MemoryWrite32(Dynautic::A64::VAddr, u32) override {}
    void MemoryWrite64(Dynautic::A64::VAddr, u64) override {}
    void MemoryWrite128(Dynautic::A64::VAddr, Dynautic::A64::Vector) override {}

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
    MyEnvironment env;
    Dynautic::A64::UserConfig user_config;

public:
    TestDynautic() {
        user_config.callbacks = &env;
        user_config.check_halt_on_memory_access = false;
        user_config.native_memory = true;
    }

    u64 RunTest(Function *fnc) override {
        u64 fres;
        std::vector<u64> cache;

        // Run twice to test caching
        for (unsigned run = 0; run != 2; ++run) {
            // Configure
            user_config.update_cache = !(user_config.use_cache = user_config.unsafe_optimizations = user_config.fully_static = !cache.empty());
            //user_config.dump_assembly = user_config.fully_static;

            // Create runtime
            Dynautic::A64::Runtime cpu(user_config);
            env.cpu = &cpu;

            // Restore
            if (!cache.empty())
                cpu.LoadCache(cache);

            // Allocate stack
            std::vector<u8> stack(0x1024 * 0x1024 * 4 /*4 MB*/);

            // Set up registers
            cpu.SetRegister(0, 0xfabd3dd59df77212);
            cpu.SetRegister(30, exit_addr);
            cpu.SetSP(reinterpret_cast<u64>(stack.data()+stack.size()));
            cpu.SetPC(reinterpret_cast<u64>(fnc));

            // Execute
            restart:
            common::Timer timer;
            const auto halt_reason = cpu.Run();
            const auto duration = timer.get();
            switch (halt_reason) {
            case Dynautic::HaltReason::UserDefined4: break;
            case Dynautic::HaltReason::UserDefined3: cpu.SetPC(cpu.GetPC()+4); goto restart;
            default: throw std::runtime_error("Dynautic error: Unexpected halt reasons: "+std::to_string(static_cast<uint32_t>(halt_reason)));
            }

            // Save cache
            if (cache.empty())
                cache = cpu.DumpCache();

            // Get result
            if (run == 0)
                fres = cpu.GetRegister(0);
            else if (fres != cpu.GetRegister(0))
                fres = 0xcac3bad;

            std::cout << "Dynautic pass #" << std::dec << run << " done after " << duration << "ms!" << std::endl;
        }

        std::cout << "Dynautic done!" << std::endl;
        return fres;
    }
};

#endif // DYNAUTIC_HPP
