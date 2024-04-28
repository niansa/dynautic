#include "dynautic.hpp"
#include "unicorn.hpp"

#include <iostream>
#include <memory>
#include <array>
#include <string_view>
#include <fstream>
#include <filesystem>
#include <cstdint>
#include <cstdio>



int main(int argc, char** argv) {
    std::unique_ptr<TestBase> dynautic = std::make_unique<TestDynautic>(),
                              unicorn = std::make_unique<TestUnicorn>();

    dynautic->RunTest("Copy using mov zr to 64bit register", {
                      0xaa1f03e0, // mov x0, xzr
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Copy using movz to 32bit register", {
                      0x52800540, // movz w0, #0x2a
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Copy using movk to 64bit register", {
                      0xf2800540, // movk x0, #0x2a
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Copy using movk to 32bit register", {
                      0x72800540, // movk w0, #0x2a
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Copy using movz to 32bit register with 16bit shift", {
                      0x52a00540, // movz w0, #0x2a, lsl #16
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Copy using movz to 64bit register with 48bit shift", {
                      0xd2e00540, // movz x0, #0x2a, lsl #48
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Combine movz and movk in 64bit registers", {
                      0xd2854000, // movz x0, #0x2a00
                      0xf2a24680, // movk x0, #0x1234, lsl #16
                      0xf2d579a0, // movk x0, #0xabcd, lsl #32
                      0xf2fbd5a0, // movk x0, #0xdead, lsl #48
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("32bit orr one 64bit register on another", {
                      0xaac183e0, // orr x0, xzr, x1, ror #32 (mov x0, x1, ror #32)
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("16bit orr one 32bit register on another", {
                      0x2ac143e0, // orr w0, wzr, w1, ror #16 (mov w0, w1, ror #16)
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple 64bit addition using immediate", {
                      0x91024400, // add x0, x0, #145
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple 32bit addition using immediate", {
                      0x11024400, // add w0, w0, #145
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple 64bit addition using register", {
                      0x8b010000, // add x0, x0, x1
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple 32bit addition using register", {
                      0x0b010000, // add w0, w0, w1
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple 64bit addition using immediate with 12bit shift", {
                      0x91400400, // add x0, x0, #1, lsl #12
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple 64bit register bitflip", {
                      0xaa2003e0, // mvn x0, x0
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple 32bit register bitflip", {
                      0x2a2003e0, // mvn w0, w0
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple 64bit negative xor", {
                      0xca210000, // eon x0, x0, x1
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Mixture of shift instructions", {
                      0xd2800084, // mov x4, #4
                      0x9ac42400, // lsr x0, x0, x4
                      0xd37ef400, // lsl x0, x0, #2
                      0x93c08000, // ror x0, x0, #32
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Unconditional branching", {
                      0x14000002, // b 8
                      0xd28175a0, // mov x0, #0xbad
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Unconditional branching with link register", {
                      0x14000002, // b 8
                      0xd28175a0, // mov x0, #0xbad
                      0xaa1e03e0, // mov x0, x30
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple conditional branching", {
                      0xd2800001,
                      0xb4000042,
                      0x91000421,
                      0xb5000042,
                      0x91000421,
                      0xb4000042,
                      0x91000421,
                      0xb5000002,
                      0x91000421,
                      0xaa0103e0,
                      0xd65f03c0
                  }, unicorn.get());

    dynautic->RunTest("Intersecting conditional branching", {
                      0x14000003, // b c
                      0xd28175a0, // mov x0, #0xbad
                      0x14000002, // b 10
                      0x91000400, // add x0, x0, #0x1
                      0x91000400, // add x0, x0, #0x1
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple function calling", {
                      0xf900045e, // str x30, [x2, #0x8]
                      0x94000004, // bl 14
                      0xd1000400, // sub x0, x0, #1
                      0xf940045e, // ldr x30, [x2, #0x8]
                      0xd65f03c0, // ret
                      0xd2800f60, // mov x0, #123
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("64bit load instruction pre/post register updating", {
                      0xaa0a03e4, // mov x4, x10
                      0xf9400080, // ldr x0, [x4]
                      0xf9400480, // ldr x0, [x4, #0x8]
                      0xf8408c80, // ldr x0, [x4, #0x8]!
                      0xf8408c80, // ldr x0, [x4, #0x8]!
                      0xf8408c80, // ldr x0, [x4, #0x8]!
                      0xf85f0c80, // ldr x0, [x4, #-0x10]!
                      0xa9400480, // ldp x0, x1, [x4]
                      0xa9408480, // ldp x0, x1, [x4, #0x8]
                      0xa9c08480, // ldp x0, x1, [x4, #0x8]!
                      0xa9c08480, // ldp x0, x1, [x4, #0x8]!
                      0xa9ff8480, // ldp x0, x1, [x4, #-0x8]!
                      0xaa0403e0, // mov x0, x4
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("64bit store instruction pre/post register updating", {
                      0xaa0a03e4, // mov x4, x10
                      0xf9000080, // str x0, [x4]
                      0xf9000480, // str x0, [x4, #0x8]
                      0xf8008c80, // str x0, [x4, #0x8]!
                      0xf8008c80, // str x0, [x4, #0x8]!
                      0xf8008c80, // str x0, [x4, #0x8]!
                      0xf81f0c80, // str x0, [x4, #-0x10]!
                      0xa9000480, // stp x0, x1, [x4]
                      0xa9008480, // stp x0, x1, [x4, #0x8]
                      0xa9010480, // stp x0, x1, [x4, #0x10]
                      0xa9808480, // stp x0, x1, [x4, #0x8]!
                      0xa9808480, // stp x0, x1, [x4, #0x8]!
                      0xa9bf8480, // stp x0, x1, [x4, #-0x8]!
                      0xaa0403e0, // mov x0, x4
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("32bit load instruction pre/post register updating", {
                      0xaa0a03e4, // mov x4, x10
                      0xb9400080, // ldr w0, [x4]
                      0xb9400880, // ldr w0, [x4, #0x8]
                      0xb8408c80, // ldr w0, [x4, #0x8]!
                      0xb8408c80, // ldr w0, [x4, #0x8]!
                      0xb8408c80, // ldr w0, [x4, #0x8]!
                      0x29400480, // ldp w0, w1, [x4]
                      0x29410480, // ldp w0, w1, [x4, #0x8]
                      0x29c10480, // ldp w0, w1, [x4, #0x8]!
                      0x29c10480, // ldp w0, w1, [x4, #0x8]!
                      0xaa0403e0, // mov x0, x4
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Standard function prologue", {
                      0xa9be7bfd, // stp x29, x30, [sp, #-32]!
                      0x910003fd, // mov x29, sp
                      0x910073e0, // add x0, sp, #0x1c
                      0x94000001, // bl 4
                      0xa9be7bfd, // stp x29, x30, [sp, #-32]!
                      0x910003fd, // mov x29, sp
                      0xf9000fe0, // str x0, [sp, #24]
                      0xd61f02e0, // br x23
                  }, unicorn.get());

    dynautic->RunTest("Simple matching conditional jump using cmp instruction", {
                      0xf109603f, // cmp x1, #600
                      0x5400004c, // b.gt c
                      0xd2800000, // mov x0, #0
                      0xd65f03c0  // ret
                  }, unicorn.get());

    dynautic->RunTest("Simple non-matching conditional jump using cmp instruction", {
                      0xf109603f, // cmp x1, #600
                      0x54000040, // b.eq c
                      0xd2800000, // mov x0, #0
                      0xd65f03c0  // ret
                  }, unicorn.get());

    for (const auto& entry : std::filesystem::directory_iterator(TEST_BINS)) {
        if (!entry.is_regular_file())
            continue;

        const auto& path = entry.path();
        if (path.extension() != ".bin")
            continue;

        std::ifstream file(path, std::ios::binary);
        std::vector<uint32_t> binary;
        do {
            binary.push_back(0xffffffff);
        } while (file.read(reinterpret_cast<char*>(&binary.back()), 4));
        binary.pop_back();

        dynautic->RunTest("Test from "+std::string(path.filename()), std::move(binary), unicorn.get());
    }
}
