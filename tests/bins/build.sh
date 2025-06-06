#! /bin/sh

rm -f *.bin *.asm
for source in *.c *.s; do
    for opt in 0 3; do
        aarch64-linux-gnu-gcc -static -Wall -fno-builtin -fno-exceptions -fno-stack-protector -mgeneral-regs-only -march=armv8.1-a -O$opt -nostdlib -T ./binary.ld -o "$source".elf "$source" ./lib/*.c &&
        aarch64-linux-gnu-objdump -d "$source".elf | tee "$source"-O"$opt".asm &&
        aarch64-linux-gnu-objcopy -S -O binary "$source".elf "$source"-O"$opt".bin
        rm -f "$source".elf
    done
done

rm brainfuck.c-O0.bin primes.c-O0.bin vectorization.c-O0.bin *.s-O3.*
