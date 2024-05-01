#include "common.hpp"
#include "dynautic.hpp"
#include "native.hpp"

#include <memory>



uint64_t simple_val_return() noexcept {
    return 0x1234;
}

uint64_t simple_function_call() noexcept {
    return simple_val_return();
}


int main() {
    std::unique_ptr<TestBase> dynautic = std::make_unique<TestDynautic>(),
                              native = std::make_unique<TestNative>();

    dynautic->RunTest("Simple value return", &simple_val_return, native.get());
    dynautic->RunTest("Simple function call", &simple_function_call, native.get());
}
