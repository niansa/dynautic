#ifndef NATIVE_HPP
#define NATIVE_HPP
#include "common.hpp"

#include <stdexcept>
#include <dynautic/A64.hpp>



class TestNative final : public TestBase {
public:
    u64 RunTest(Function *fnc) override {
        common::Timer timer;
        u64 fres = fnc();
        const auto duration = timer.get();
        std::cout << "Native done after " << duration << "ms!" << std::endl;
        return fres;
    }
};

#endif // NATIVE_HPP
