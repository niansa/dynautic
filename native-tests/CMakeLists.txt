cmake_minimum_required(VERSION 3.9)

project(dynautic_tests LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(.. dynautic)

add_executable(dynautic_test test.cpp common.hpp dynautic.hpp native.hpp timer.hpp)
target_link_libraries(dynautic_test PRIVATE dynautic unicorn)
target_compile_options(dynautic_test PRIVATE -fno-stack-protector -mgeneral-regs-only)
