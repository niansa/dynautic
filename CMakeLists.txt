cmake_minimum_required(VERSION 3.9)

project(dynautic LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(LLVM REQUIRED)
separate_arguments(LLVM_DEFINITIONS)

include(cppharden/harden.cmake)

set(CAPSTONE_BUILD_TESTS OFF)
set(CAPSTONE_BUILD_STATIC OFF)
set(CAPSTONE_BUILD_STATIC_RUNTIME OFF)
set(CAPSTONE_ARCHITECTURE_DEFAULT OFF)
set(CAPSTONE_AARCH64_SUPPORT ON)
add_subdirectory(externals/capstone)

add_library(dynautic STATIC
    include/dynautic/common.hpp include/dynautic/optimization_flags.hpp
    include/dynautic/A64.hpp
    src/llvm.hpp
    src/A64/runtime.hpp src/A64/runtime.cpp
    src/A64/cache.hpp src/A64/cache.cpp
    src/A64/lifter.hpp src/A64/lifter.cpp
    src/A64/lifter_instance.hpp src/A64/lifter_instance.cpp
    src/A64/lifter_instructions.hpp src/A64/lifter_instructions.cpp
    src/A64/lifter_registers.cpp
    src/A64/lifter_shifts.cpp
    src/A64/lifter_glue_emitters.cpp
    src/A64/lifter_trampolines.cpp
)
target_include_directories(dynautic PRIVATE ${LLVM_INCLUDE_DIRS} PUBLIC include)
target_compile_definitions(dynautic PRIVATE ${LLVM_DEFINITIONS})
target_link_libraries(dynautic PRIVATE capstone)
target_precompile_headers(dynautic PRIVATE src/llvm.hpp)
#target_compile_options(dynautic PRIVATE -fno-exceptions)
llvm_config(dynautic core executionengine orcjit nativecodegen)
target_hardening(dynautic)
target_compile_options(dynautic PRIVATE -Wno-error=cast-qual -Wno-error=implicit-fallthrough -Wno-string-conversion -Wno-sign-conversion)

if (CMAKE_BUILD_TYPE STREQUAL Debug)
    target_compile_definitions(dynautic PRIVATE ENABLE_LLVM_VALIDATION)
endif()

install(TARGETS dynautic
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
