_start:
str x30, [sp, #-32]!
bl      test
ldr x30, [sp], #32
ret

test:
ret
