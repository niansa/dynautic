unsigned long is_prime_cpu(unsigned long num) {
     if (num % 2 == 0 && num > 2) return 0;
     for(int i = 3; i < num / 2; i+= 2)
         if (num % i == 0)
             return 0;
     return 1;
}


__attribute__((section(".start")))
unsigned long _start() {
    unsigned long fres = 0;
    for (unsigned long it = 2; it != 10000; ++it)
        fres += is_prime_cpu(it);
    return fres;
}
