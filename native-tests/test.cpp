#include "common.hpp"
#include "dynautic.hpp"
#include "native.hpp"

#include <memory>

uint64_t simple_val_return() noexcept { return 0x1234; }

uint64_t simple_function_call() noexcept { return simple_val_return(); }

void simple_recursion_func(unsigned *x) noexcept {
    if ((*x)++ < 100)
        simple_recursion_func(x);
}
uint64_t simple_recursion() {
    unsigned fres = 63;
    simple_recursion_func(&fres);
    return fres;
}

unsigned long is_prime_cpu(unsigned long num) noexcept {
    if (num % 2 == 0 && num > 2)
        return 0;
    for (int i = 3; i < num / 2; i += 2)
        if (num % i == 0)
            return 0;
    return 1;
}
uint64_t primes() noexcept {
    unsigned long fres = 0;
    for (unsigned long it = 2; it != 1000000; ++it)
        fres += is_prime_cpu(it);
    return fres;
}

typedef unsigned char byte;
void brainfuck_zmem(byte *memory, unsigned length) noexcept {
    for (unsigned idx = 0; idx != length; ++idx)
        memory[idx] = 0;
}
void brainfuck_procchar(char c, unsigned long *result) noexcept {
    *result ^= (*result << 10);
    *result ^= (*result >> 18);
    *result ^= (*result << 2);
    *result += c;
}
void brainfuck_interpret(const char *code, unsigned long *result) noexcept {
    static byte memory[1024];
    brainfuck_zmem(memory, sizeof(memory));
    byte *ptr = memory;
    static const char *stack[1024];
    const char **stack_ptr = stack;
    for (const char *instruction = code; *instruction; ++instruction) {
        switch (*instruction) {
        case '<':
            --ptr;
            break;
        case '>':
            ++ptr;
            break;
        case '+':
            ++*ptr;
            break;
        case '-':
            --*ptr;
            break;
        case '.':
            brainfuck_procchar((char)*ptr, result);
            break;
        case '[':
            *(stack_ptr++) = instruction;
            break;
        case ']': {
            if (*ptr == 0)
                --stack_ptr;
            else
                instruction = *(stack_ptr - 1);
        } break;
        }
    }
}
uint64_t brainfuck() noexcept {
    const char code[] = "[ This program prints Sierpinski triangle on 80-column display. ] > + + "
                        "+ + [ < + + + + + + + + > - ] > + + + + + + + + [ > + + + + < - ] > > + "
                        "+ > > > + > > > + < < < < < < < < < < [ - [ - > + < ] > [ - < + > > > . "
                        "< < ] > > > [ [ - > + + + + + + + + [ > + + + + < - ] > . < < [ - > + < "
                        "] + > [ - > + + + + + + + + + + < < + > ] > . [ - ] > ] ] + < < < [ - [ "
                        "- > + < ] + > [ - < + > > > - [ - > + < ] + + > [ - < - > ] < < < ] < < "
                        "< < ] + + + + + + + + + + . + + + . [ - ] < ] + + + + + * * * * * M a d "
                        "e * B y : * N Y Y R I K K I * 2 0 0 2 * * * * *";
    unsigned long fres = 0;
    brainfuck_interpret(code, &fres);
    return fres;
}

int main() {
    std::unique_ptr<TestBase> dynautic = std::make_unique<TestDynautic>(), native = std::make_unique<TestNative>();

    dynautic->RunTest("Simple value return", &simple_val_return, native.get());
    dynautic->RunTest("Simple function call", &simple_function_call, native.get());
    dynautic->RunTest("Simple recursive function call", &simple_recursion, native.get());
    dynautic->RunTest("Brainfuck", &brainfuck, native.get());
    dynautic->RunTest("Primes", &primes, native.get());
}
