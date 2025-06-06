#ifndef NATIVE_HPP
#define NATIVE_HPP
#include "common.hpp"

#include <dynautic/A64.hpp>
#include <stdexcept>

class TestNative final : public TestBase {
public:
    u64 RunTest(Function *fnc) override {
        common::Timer timer;
        u64 fres = fnc();
        const auto duration = timer.get();
        std::cout << "Native done after " << std::dec << duration << "ms!" << std::endl;
        return fres;
    }
};

#endif // NATIVE_HPP
