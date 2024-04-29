void test(unsigned *x);

unsigned _start(unsigned fres) {
    test(&fres);
    return fres;
}

void test(unsigned *x) {
    if ((*x)++ < 100)
        test(x);
}
