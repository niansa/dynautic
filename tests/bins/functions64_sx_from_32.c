void test(unsigned long *x);

__attribute__((section(".start")))
unsigned long _start() {
    unsigned long fres;
    test(&fres);
    return fres;
}

int test2() {
    return 0xdeadbeef;
}

void test(unsigned long *x) {
    *x = test2();
}
