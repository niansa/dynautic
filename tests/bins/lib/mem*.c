void *memcpy(void *dest, const void *src, unsigned long n) {
    for (unsigned long it = 0; it != n; it++)
        ((char*)dest)[it] = ((char*)src)[it];
    return dest;
}

void *memset(void *s, int c, unsigned long n) {
    for (unsigned long it = 0; it != n; it++)
        ((char*)s)[it] = (char)c;
    return s;
}

void *memmove(void *dest, const void *src, unsigned long n) {
    for (unsigned long it = n; it != 0; it--)
        ((char*)dest)[it-1] = ((char*)src)[it-1];
    return dest;
}
