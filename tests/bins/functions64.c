void test(unsigned long *x);

__attribute__((section(".start")))
unsigned long _start() {
    unsigned long fres;
    test(&fres);
    return fres;
}

unsigned long test2() {
    return 0xabcd1234deadbeef;
}

void test(unsigned long *x) {
    *x = test2();
}
