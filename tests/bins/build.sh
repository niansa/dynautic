#! /bin/sh

rm -f *.bin
for source in *.c *.s; do
    for opt in 0 2; do
        aarch64-linux-gnu-gcc -static -Wall -fno-builtin -fno-exceptions -fno-stack-protector -fno-tree-loop-distribute-patterns -mgeneral-regs-only -O$opt -nostdlib -T ./binary.ld -o "$source".so "$source" &&
        aarch64-linux-gnu-objdump -d "$source".so &&
        aarch64-linux-gnu-objcopy -S -O binary --image-base 16 "$source".so "$source"-O"$opt".bin
        rm -f "$source".so
    done
done
