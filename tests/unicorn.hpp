#ifndef UNICORN_HPP
#define UNICORN_HPP
#include "common.hpp"

#include <stdexcept>
#include <unicorn/unicorn.h>



class TestUnicorn final : public TestBase {
    uc_engine *uc;

    void handle_error(uc_err err) {
        if (err)
            throw std::runtime_error("Unicorn error: "+std::string(uc_strerror(err)));
    }

public:
    uint64_t RunTest(std::vector<u32>&& instructions, std::array<u8, TestBase::mem_size>& memory, bool no_native_memory) override {
        (void)no_native_memory;

        memory.fill(0);

        handle_error(uc_open(UC_ARCH_ARM64, UC_MODE_ARM, &uc));

        handle_error(uc_mem_map(uc, 0x0, TestBase::mem_size, UC_PROT_ALL));
        handle_error(uc_mem_write(uc, 0x0, memory.data(), memory.size()));

        // Copy instructions to memory
        for (unsigned addr = exe_base, idx = 0; idx != instructions.size(); addr += 4, ++idx) {
            const u32 instruction = instructions[idx];
            handle_error(uc_mem_write(uc, addr, &instruction, sizeof(instruction)));
        }

        // Set up registers
        const u64 x0 = 0xfabd3dd59df77212,
                  x1 = 0xabcdfea1,
                  x2 = 0x0,
                  x10 = heap_base,
                  x23 = exit_addr,
                  x24 = exe_base,
                  x30 = exit_addr,
                  PC = exe_base,
                  SP = stack_addr;
        uc_reg_write(uc, UC_ARM64_REG_X0, &x0);
        uc_reg_write(uc, UC_ARM64_REG_X1, &x1);
        uc_reg_write(uc, UC_ARM64_REG_X2, &x2);
        uc_reg_write(uc, UC_ARM64_REG_X10, &x10);
        uc_reg_write(uc, UC_ARM64_REG_X23, &x23);
        uc_reg_write(uc, UC_ARM64_REG_X24, &x24);
        uc_reg_write(uc, UC_ARM64_REG_X30, &x30);
        uc_reg_write(uc, UC_ARM64_REG_SP, &SP);

        // Execute
        common::Timer timer;
        const uc_err execution_error = uc_emu_start(uc, exe_base, exit_addr, 0, 0);
        const auto duration = timer.get();
        if (execution_error)
            std::cerr << "Unicorn execution error: " << uc_strerror(execution_error) << std::endl;

        // Check result
        u64 result;
        uc_reg_read(uc, UC_ARM64_REG_X0, &result);
        handle_error(uc_mem_read(uc, 0x0, memory.data(), memory.size()));
        std::cout << "Unicorn done after " << std::dec << duration << "ms!" << std::endl;
        return result;
    }
};

#endif // UNICORN_HPP
