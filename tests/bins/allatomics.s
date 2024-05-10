_start:
ldxr x0, [x24]
stxr w2, x0, [x24]
add x24, x24, #0x8
ldxrb w0, [x24]
stxrb w4, w0, [x24]
add x24, x24, #0x8
ldxrh w0, [x24]
stxrh w6, w0, [x24]
add x24, x24, #0x16
ldxp x0, x1, [x24]
stxp w8, x0, x1, [x24]

ret
