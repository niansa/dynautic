_start:
//mov x27, x24
//cas x0, x1, [x24]
//add x24, x24, #8
//casa x0, x3, [x24]
//add x24, x24, #8
//casal x0, x5, [x24]
//add x24, x24, #8
//casl x0, x7, [x24]

//mov x24, x27
ldxr x1, [x24]
add x1, x1, #7
stxr w3, x1, [x24]
add x1, x1, x3

ret
