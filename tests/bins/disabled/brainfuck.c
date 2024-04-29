typedef unsigned char byte;

void interpret(const char *code, unsigned long *result);

__attribute__((section(".start")))
unsigned long _start() {
    const char code[] = "[ This program prints Sierpinski triangle on 80-column display. ] > + + + + [ < + + + + + + + + > - ] > + + + + + + + + [ > + + + + < - ] > > + + > > > + > > > + < < < < < < < < < < [ - [ - > + < ] > [ - < + > > > . < < ] > > > [ [ - > + + + + + + + + [ > + + + + < - ] > . < < [ - > + < ] + > [ - > + + + + + + + + + + < < + > ] > . [ - ] > ] ] + < < < [ - [ - > + < ] + > [ - < + > > > - [ - > + < ] + + > [ - < - > ] < < < ] < < < < ] + + + + + + + + + + . + + + . [ - ] < ] + + + + + * * * * * M a d e * B y : * N Y Y R I K K I * 2 0 0 2 * * * * *";
    unsigned long fres = 0;
    interpret(code, &fres);
    return fres;
}

void *memcpy(void *dest, const void *src, unsigned long n) {
    for (unsigned long it = 0; it != n; it++)
        ((char*)dest)[it] = ((char*)src)[it];
    return dest;
}

void zmem(byte *memory, unsigned length) {
    for (unsigned idx = 0; idx != length; ++idx)
        memory[idx] = 0;
}

void procchar(char c, unsigned long *result) {
    *result ^= (*result << 10);
    *result ^= (*result >> 18);
    *result ^= (*result << 2);
    *result += c;
}

void interpret(const char *code, unsigned long *result) {
    byte memory[10240];
    zmem(memory, 10240);
    byte *ptr = memory;
    const char *stack[1024];
    const char **stack_ptr = stack;
    for (const char *instruction = code; *instruction; ++instruction) {
        switch (*instruction) {
        case '<': --ptr; break;
        case '>': ++ptr; break;
        case '+': ++*ptr; break;
        case '-': --*ptr; break;
        case '.': procchar((char)*ptr, result); break;
        case '[': *(stack_ptr++) = instruction; break;
        case ']': {
            if (*ptr == 0)
                --stack_ptr;
            else
                instruction = *(stack_ptr-1);
        } break;
        }
    }
}
