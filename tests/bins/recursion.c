void test(unsigned *x);

unsigned _start() {
    unsigned fres = 0;
    test(&fres);
    return fres;
}

void test(unsigned *x) {
    if ((*x)++ < 100)
        test(x);
}
