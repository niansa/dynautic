// Source: https://hrishim.github.io/llvl_prog1_book/integer_inst.html#counting-leading-zeroes


    // Your code starts here
    mov    w1, w0 //copy the number to w1

    // Initialize count to 0; we will use w0
    mov    w0, 0

    // Test if bit 31 of value is 1. If it is 1, branch to label 'done'
    tbnz    w1, #31, done

    // Keep left shifting the value by one until leftmost bit does not become 1
loop:
    // Left shift the value by 1
    lsl    w1, w1, 1

    // Increment the count by 1
    add    w0, w0, 1

    // Test if bit 31 is 1. If it is not 1, branch back to label 'loop'
    tbz    w1, #31, loop
done:
    // Your code ends here
    ret
