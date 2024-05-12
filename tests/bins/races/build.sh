#! /bin/sh

rm -f *.bin
for source in *.s; do
    aarch64-linux-gnu-gcc -static -Wall -fno-builtin -fno-exceptions -fno-stack-protector -mgeneral-regs-only -march=armv8.1-a -O2 -nostdlib -T ../binary.ld -o "$source".elf "$source" &&
    aarch64-linux-gnu-objdump -d "$source".elf &&
    aarch64-linux-gnu-objcopy -S -O binary "$source".elf "$source".bin
    rm -f "$source".elf
done
