#ifndef COMMON_HPP
#define COMMON_HPP
#include <iostream>
#include <string_view>
#include <array>
#include <vector>
#include <fstream>
#include <cstdint>

using u8 = std::uint8_t;
using u16 = std::uint16_t;
using u32 = std::uint32_t;
using u64 = std::uint64_t;


class TestBase {
public:
    constexpr static size_t mem_size = 0x80000,
                            heap_base = 0x10000,
                            exe_base = 0x10,
                            exit_addr = 0x40000,
                            stack_addr = 0x60000;

    TestBase() {}
    virtual ~TestBase() {}

    virtual u64 RunTest(std::vector<u32>&& instructions, std::array<u8, TestBase::mem_size>& memory) = 0;

    void RunTest(std::string_view test_name, std::vector<u32>&& instructions, u64 expected_result, std::array<u8, TestBase::mem_size>& memory) {
        std::cout << "Running test: " << test_name << "..." << std::endl;
        const auto result = RunTest(std::move(instructions), memory);
        if (result != expected_result)
            std::cerr << std::hex << "Test failed! Result: 0x" << result << " (expected 0x" << expected_result << ")!\n" << std::endl;
        else
            std::cout << std::hex << "Test successful (0x" << result << ").\n" << std::endl;
    }

    void RunTest(std::string_view test_name, std::vector<u32>&& instructions, TestBase *validator) {
        std::vector<u32> instructions_copy = instructions;
        std::array<u8, TestBase::mem_size> expected_memory;
        std::cout << "Getting reference value: ";
        const u64 expected_result = validator->RunTest(std::move(instructions_copy), expected_memory);
        std::array<u8, TestBase::mem_size> memory;
        RunTest(test_name, std::move(instructions), expected_result, memory);
        std::fill(memory.begin()+exit_addr, memory.begin()+exit_addr+16, 0);
        std::fill(expected_memory.begin()+exit_addr, expected_memory.begin()+exit_addr+16, 0);
        if (memory != expected_memory) {
            std::cerr << "Memory mismatch! Dumping and exiting...\n" << std::endl;
            std::ofstream f1("memory.bin", std::ios::binary);
            std::ofstream f2("memory_expected.bin", std::ios::binary);
            f1.write(reinterpret_cast<const char*>(memory.data()), memory.size());
            f2.write(reinterpret_cast<const char*>(expected_memory.data()), expected_memory.size());
            abort();
        }
    }
};
#endif // COMMON_HPP
