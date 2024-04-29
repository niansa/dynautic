void test(unsigned *x);

__attribute__((section(".start")))
unsigned _start(unsigned fres) {
    test(&fres);
    return fres;
}

void test(unsigned *x) {
    if ((*x)++ < 100)
        test(x);
}
