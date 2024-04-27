unsigned long start_(unsigned long value, unsigned long value2) {
    const unsigned long value3 = value;
    value += value2;
    value /= value2+7;
    value *= value2;
    value %= value3;
    return value;
}
