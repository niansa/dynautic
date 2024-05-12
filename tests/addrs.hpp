#ifndef ADDRS_HPP
#define ADDRS_HPP
#include <cstddef>


class Addrs {
public:
    constexpr static size_t mem_size = 0xf0000,
                            heap_base = 0x10000,
                            exe_base = 0xe0000,
                            exit_addr = 0x40000,
                            stack_addr = 0x60000;
};
#endif // ADDRS_HPP
