_start:
mov x0, #0

restart:
ldxr x1, [x24]
add x1, x1, #1
stxr w2, x1, [x24]
cbnz w2, restart
svc #5

ret
