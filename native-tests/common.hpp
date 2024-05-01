#ifndef COMMON_HPP
#define COMMON_HPP
#include "timer.hpp"

#include <iostream>
#include <string_view>
#include <vector>
#include <fstream>
#include <cstdint>

using u8 = std::uint8_t;
using u16 = std::uint16_t;
using u32 = std::uint32_t;
using u64 = std::uint64_t;


class TestBase {
public:
    using Function = u64();

    constexpr static size_t exit_addr = 0x40000;

    TestBase() {}
    virtual ~TestBase() {}

    virtual u64 RunTest(Function *fnc) = 0;

    void RunTest(std::string_view test_name, Function *fnc, u64 expected_result) {
        std::cout << "Running test: " << test_name << "..." << std::endl;
        const auto result = RunTest(fnc);
        if (result != expected_result)
            std::cerr << std::hex << "Test failed! Function result: 0x" << result << " (expected 0x" << expected_result << ")!\n" << std::endl;
        else
            std::cout << std::hex << "Function result matches (0x" << result << ").\n" << std::endl;
    }

    void RunTest(std::string_view test_name, Function *fnc, TestBase *validator) {
        std::cout << "Getting reference value: ";
        const u64 expected_result = validator->RunTest(fnc);
        RunTest(test_name, fnc, expected_result);
    }
};
#endif // COMMON_HPP
