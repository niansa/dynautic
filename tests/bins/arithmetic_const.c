unsigned long start_(unsigned long value) {
    value += 12;
    value /= 7;
    value *= 3;
    value %= 17;
    return value;
}
