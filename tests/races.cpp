#include "addrs.hpp"

#include <cstring>
#include <dynautic/A64.hpp>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <mutex>
#include <stdexcept>
#include <sys/mman.h>
#include <thread>
#include <unordered_map>
#include <vector>

using u8 = std::uint8_t;
using u16 = std::uint16_t;
using u32 = std::uint32_t;
using u64 = std::uint64_t;

class DynauticEnv final : public Dynautic::A64::UserCallbacks {
public:
    using u128 = Dynautic::A64::Vector;

    std::unordered_map<std::thread::id, Dynautic::A64::Runtime *> cpus;
    std::mutex cpus_mutex;

    std::mutex print_mutex;

    u64 ticks_left = 0;
    std::array<u8, Addrs::mem_size> memory{};

    Dynautic::A64::Runtime& GetCPU() { return *cpus[std::this_thread::get_id()]; }

    u8 MemoryRead8(u64 vaddr) override {
        if (vaddr >= memory.size()) {
            GetCPU().HaltExecution(Dynautic::HaltReason::MemoryAbort);
            return 0;
        }
        return memory[vaddr];
    }

    u16 MemoryRead16(u64 vaddr) override { return u16(MemoryRead8(vaddr)) | u16(MemoryRead8(vaddr + 1)) << 8; }

    u32 MemoryRead32(u64 vaddr) override { return u32(MemoryRead16(vaddr)) | u32(MemoryRead16(vaddr + 2)) << 16; }

    u64 MemoryRead64(u64 vaddr) override { return u64(MemoryRead32(vaddr)) | u64(MemoryRead32(vaddr + 4)) << 32; }

    u128 MemoryRead128(u64 vaddr) override { return {MemoryRead64(vaddr), MemoryRead64(vaddr + 8)}; }

    void MemoryWrite8(u64 vaddr, u8 value) override {
        if (vaddr >= memory.size()) {
            GetCPU().HaltExecution(Dynautic::HaltReason::MemoryAbort);
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
        MemoryWrite64(vaddr + 8, value[1]);
    }

    void InterpreterFallback(u64 pc, size_t num_instructions) override {
        // This is never called in practice.
        std::terminate();
    }

    void CallSVC(u32 swi) override {
        if (swi == 4) {
            GetCPU().HaltExecution(Dynautic::HaltReason::UserDefined4);
        } else if (swi == 5) {
            std::scoped_lock L(print_mutex);
            std::cout << std::to_string(GetCPU().GetRegister(1)) + ' ' << std::flush;
        } else {
            GetCPU().HaltExecution(Dynautic::HaltReason::UserDefined1);
        }
    }

    void ExceptionRaised(u64 pc, ::Dynautic::A64::Exception exception) override {
        std::cerr << "Dynautic error: Exception raised at " << reinterpret_cast<void *>(pc) << ": " << static_cast<unsigned>(exception) << std::endl;
        if (exception == Dynautic::A64::Exception::UnallocatedEncoding || exception == Dynautic::A64::Exception::UnpredictableInstruction)
            GetCPU().HaltExecution(Dynautic::HaltReason::UserDefined3);
        else
            GetCPU().HaltExecution(Dynautic::HaltReason::UserDefined7);
    }

    void AddTicks(u64 ticks) override {
        if (ticks > ticks_left) {
            ticks_left = 0;
            return;
        }
        ticks_left -= ticks;
    }

    u64 GetTicksRemaining() override { return ticks_left; }

    std::uint64_t GetCNTPCT() override { return 0; }
};

class TestDynautic : public Addrs {
    constexpr static unsigned thread_count = 32;

    DynauticEnv env;
    Dynautic::A64::UserConfig user_config;

public:
    TestDynautic() {
        user_config.callbacks = &env;
        user_config.check_halt_on_memory_access = false;
        mmap(reinterpret_cast<void *>(exe_base), 1024 * 1024 /*1 MB*/, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    }

    void Run(std::vector<u32>&& instructions) {
        // Run twice to test caching
        for (unsigned run = 0; run != 2; ++run) {
            env.memory.fill(0);

            // Configure
            user_config.native_memory = run == 1;

            // Copy instructions to memory
            for (unsigned addr = exe_base, idx = 0; idx != instructions.size(); addr += 4, ++idx) {
                env.MemoryWrite32(addr, instructions[idx]);
            }
            if (user_config.native_memory)
                memcpy(reinterpret_cast<void *>(exe_base), instructions.data(), instructions.size() * 4);

            // Write exit SVC instruction
            env.MemoryWrite32(exit_addr, 0xd4000081);     // svc #4
            env.MemoryWrite32(exit_addr + 4, 0xd65f03c0); // ret

            // Create threads
            std::vector<std::thread> threads;
            for (unsigned thread = 0; thread != thread_count; thread++) {
                threads.emplace_back([&, thread, this]() {
                    // Thread-specific configuration
                    auto this_config = user_config;
                    this_config.processor_id = thread;
                    this_config.tpidr_el0 = &this_config.processor_id;
                    this_config.tpidrro_el0 = &this_config.processor_id;
                    // this_config.dump_assembly = thread == 0;

                    // Create runtime
                    Dynautic::A64::Runtime cpu(this_config);
                    env.cpus_mutex.lock();
                    env.cpus[std::this_thread::get_id()] = &cpu;
                    env.cpus_mutex.unlock();

                    // Set up heap and stack
                    Dynautic::A64::VAddr stack_addr = this->stack_addr;
                    Dynautic::A64::VAddr heap_base = this->heap_base;
                    if (user_config.native_memory) {
                        stack_addr = reinterpret_cast<Dynautic::A64::VAddr>(&env.memory[stack_addr]);
                        heap_base = reinterpret_cast<Dynautic::A64::VAddr>(&env.memory[heap_base]);
                    }

                    // Set up registers
                    cpu.SetRegister(24, heap_base);
                    cpu.SetRegister(30, exit_addr);
                    cpu.SetSP(stack_addr);
                    cpu.SetPC(exe_base);

                    // Execute
                    const auto halt_reason = cpu.Run();
                    switch (halt_reason) {
                    case Dynautic::HaltReason::UserDefined4:
                        break;
                    case Dynautic::HaltReason::UserDefined3:
                        throw std::runtime_error("Dynautic error: Illegal instruction");
                    default:
                        throw std::runtime_error("Dynautic error: Unexpected halt reasons: " + std::to_string(static_cast<uint32_t>(halt_reason)));
                    }
                });
            }

            // Wait for all threads to complete
            for (auto& thread : threads)
                thread.join();

            // Print final newline
            std::cout << '\n';
        }
    }
};

int main() {
    TestDynautic dynautic;

    for (const auto& entry : std::filesystem::directory_iterator(TEST_BINS)) {
        if (!entry.is_regular_file())
            continue;

        const auto& path = entry.path();
        if (path.extension() != ".bin")
            continue;

        std::cout << path.filename().string() << "..." << std::endl;

        std::ifstream file(path, std::ios::binary);
        std::vector<uint32_t> binary;
        do {
            binary.push_back(0xffffffff);
        } while (file.read(reinterpret_cast<char *>(&binary.back()), 4));
        binary.pop_back();

        dynautic.Run(std::move(binary));
        std::cout << '\n';
    }
}
