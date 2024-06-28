cmake_minimum_required(VERSION 3.9)

project(dynautic LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(LLVM 17 REQUIRED)
separate_arguments(LLVM_DEFINITIONS)

set(CAPSTONE_BUILD_TESTS OFF)
set(CAPSTONE_BUILD_STATIC OFF)
set(CAPSTONE_BUILD_STATIC_RUNTIME OFF)
set(CAPSTONE_ARCHITECTURE_DEFAULT OFF)
set(CAPSTONE_AARCH64_SUPPORT ON)
add_subdirectory(externals/capstone)

add_library(dynautic STATIC
    include/dynautic/common.hpp include/dynautic/optimization.hpp
    include/dynautic/A64.hpp
    src/llvm.hpp
    src/arch_traits.hpp
    src/globalmonitor.hpp src/globalmonitor.cpp
    src/A64/runtime.hpp src/A64/runtime.cpp
    src/A64/cache.hpp src/A64/cache.cpp
    src/A64/lifter.hpp src/A64/lifter.cpp
                       src/A64/lifter_instance.hpp src/A64/lifter_instance.cpp
                       src/A64/lifter_instructions.hpp src/A64/lifter_instructions.cpp
                                                       src/A64/lifter_instructions_macros.hpp
                                                       src/A64/lifter_instructions_base.cpp
                                                       src/A64/lifter_instructions_vector.cpp
                                                       src/A64/lifter_instructions_fp.cpp
                       src/A64/lifter_registers.cpp
                       src/A64/lifter_shifts.cpp
                       src/A64/lifter_glue_emitters.cpp
                       src/A64/lifter_conditions.cpp
                       src/A64/lifter_trampolines.cpp
)
target_include_directories(dynautic PRIVATE ${LLVM_INCLUDE_DIRS} PUBLIC include)
target_compile_definitions(dynautic PRIVATE ${LLVM_DEFINITIONS})
target_link_libraries(dynautic PRIVATE capstone)
target_precompile_headers(dynautic PRIVATE src/llvm.hpp)
target_compile_options(dynautic PRIVATE -fno-exceptions -funwind-tables)
llvm_config(dynautic USE_SHARED core executionengine orcjit nativecodegen)
target_compile_options(dynautic PRIVATE -Wno-error=cast-qual -Wno-error=implicit-fallthrough -Wno-string-conversion -Wno-sign-conversion)

if (CMAKE_BUILD_TYPE MATCHES "^Deb")
    target_compile_definitions(dynautic PRIVATE
        ENABLE_LLVM_VALIDATION
        ENABLE_ASSERTS
        ENABLE_DEBUGGER_SUPPORT
        #ENABLE_RUNTIME_DEBUG_MESSAGES
    )
endif()

install(TARGETS dynautic
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
