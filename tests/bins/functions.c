void test(unsigned *x);

unsigned _start() {
    unsigned fres;
    test(&fres);
    return fres;
}

int test2() {
    return 0xabcd1234;
}

void test(unsigned *x) {
    *x = test2();
}
