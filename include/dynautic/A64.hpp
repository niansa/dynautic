/* This file is part of the Dynarmic project.
 * Copyright (c) 2018 MerryMage
 * Copyright (c) 2024 niansa
 * SPDX-License-Identifier: 0BSD
 */

#pragma once

#include "common.hpp"
#include "optimization.hpp"

#include <string>
#include <vector>
#include <optional>
#include <memory>
#include <array>
#include <cstdint>

namespace Dynautic::A64 {
using VAddr = std::uint64_t;

using Vector = std::array<std::uint64_t, 2>;
static_assert(sizeof(Vector) == sizeof(std::uint64_t) * 2, "Vector must be 128 bits in size");

enum class Exception {
    /// An UndefinedFault occured due to executing instruction with an unallocated encoding
    UnallocatedEncoding,
    /// An UndefinedFault occured due to executing instruction containing a reserved value
    ReservedValue,
    /// An unpredictable instruction is to be executed. Implementation-defined behaviour should now happen.
    /// This behaviour is up to the user of this library to define.
    /// Note: Constraints on unpredictable behaviour are specified in the ARMv8 ARM.
    UnpredictableInstruction,
    /// A WFI instruction was executed. You may now enter a low-power state. (Hint instruction.)
    WaitForInterrupt,
    /// A WFE instruction was executed. You may now enter a low-power state if the event register is clear. (Hint instruction.)
    WaitForEvent,
    /// A SEV instruction was executed. The event register of all PEs should be set. (Hint instruction.)
    SendEvent,
    /// A SEVL instruction was executed. The event register of the current PE should be set. (Hint instruction.)
    SendEventLocal,
    /// A YIELD instruction was executed. (Hint instruction.)
    Yield,
    /// A BRK instruction was executed. (Hint instruction.)
    Breakpoint,
    /// Attempted to execute a code block at an address for which MemoryReadCode returned std::nullopt.
    /// (Intended to be used to emulate memory protection faults.)
    NoExecuteFault,
};

enum class DataCacheOperation {
    /// DC CISW
    CleanAndInvalidateBySetWay,
    /// DC CIVAC
    CleanAndInvalidateByVAToPoC,
    /// DC CSW
    CleanBySetWay,
    /// DC CVAC
    CleanByVAToPoC,
    /// DC CVAU
    CleanByVAToPoU,
    /// DC CVAP
    CleanByVAToPoP,
    /// DC ISW
    InvalidateBySetWay,
    /// DC IVAC
    InvalidateByVAToPoC,
    /// DC ZVA
    ZeroByVA,
};

struct UserCallbacks {
    virtual ~UserCallbacks() = default;

    // All reads through this callback are 4-byte aligned.
    // Memory must be interpreted as little endian.
    virtual std::optional<std::uint32_t> MemoryReadCode(VAddr vaddr) { return MemoryRead32(vaddr); }

    // Reads through these callbacks may not be aligned.
    virtual std::uint8_t MemoryRead8(VAddr vaddr) = 0;
    virtual std::uint16_t MemoryRead16(VAddr vaddr) = 0;
    virtual std::uint32_t MemoryRead32(VAddr vaddr) = 0;
    virtual std::uint64_t MemoryRead64(VAddr vaddr) = 0;
    virtual Vector MemoryRead128(VAddr vaddr) = 0;

    // Writes through these callbacks may not be aligned.
    virtual void MemoryWrite8(VAddr vaddr, std::uint8_t value) = 0;
    virtual void MemoryWrite16(VAddr vaddr, std::uint16_t value) = 0;
    virtual void MemoryWrite32(VAddr vaddr, std::uint32_t value) = 0;
    virtual void MemoryWrite64(VAddr vaddr, std::uint64_t value) = 0;
    virtual void MemoryWrite128(VAddr vaddr, Vector value) = 0;

    // Writes through these callbacks may not be aligned.
    virtual bool MemoryWriteExclusive8(VAddr /*vaddr*/, std::uint8_t /*value*/, std::uint8_t /*expected*/) { return false; }
    virtual bool MemoryWriteExclusive16(VAddr /*vaddr*/, std::uint16_t /*value*/, std::uint16_t /*expected*/) { return false; }
    virtual bool MemoryWriteExclusive32(VAddr /*vaddr*/, std::uint32_t /*value*/, std::uint32_t /*expected*/) { return false; }
    virtual bool MemoryWriteExclusive64(VAddr /*vaddr*/, std::uint64_t /*value*/, std::uint64_t /*expected*/) { return false; }
    virtual bool MemoryWriteExclusive128(VAddr /*vaddr*/, Vector /*value*/, Vector /*expected*/) { return false; }

    // If this callback returns true, the JIT will assume MemoryRead* callbacks will always
    // return the same value at any point in time for this vaddr. The JIT may use this information
    // in optimizations.
    // A conservative implementation that always returns false is safe.
    virtual bool IsReadOnlyMemory(VAddr /*vaddr*/) { return false; }

    /// The interpreter must execute exactly num_instructions starting from PC.
    virtual void InterpreterFallback(VAddr pc, size_t num_instructions) = 0;

    // This callback is called whenever a SVC instruction is executed.
    virtual void CallSVC(std::uint32_t swi) = 0;

    virtual void ExceptionRaised(VAddr pc, Exception exception) = 0;
    virtual void DataCacheOperationRaised(DataCacheOperation /*op*/, VAddr /*value*/) {}

    // Timing-related callbacks
    // ticks ticks have passed
    virtual void AddTicks(std::uint64_t ticks) = 0;
    // How many more ticks am I allowed to execute?
    virtual std::uint64_t GetTicksRemaining() = 0;
    // Get value in the emulated counter-timer physical count register.
    virtual std::uint64_t GetCNTPCT() = 0;
};

struct UserConfig {
    UserCallbacks* callbacks;

    size_t processor_id = 0;

    /// This selects other optimizations than can't otherwise be disabled by setting other
    /// configuration options.
    /// This is intended to be used for debugging.
    OptimizationFlag optimizations = all_safe_optimizations;

    bool HasOptimization(OptimizationFlag f) const {
        if (!unsafe_optimizations) {
            f &= all_safe_optimizations;
        }
        return (f & optimizations) != no_optimizations;
    }

    /// This enables unsafe optimizations that reduce emulation accuracy in favour of speed.
    /// For safety, in order to enable unsafe optimizations you have to set BOTH this flag
    /// AND the appropriate flag bits above.
    /// The prefered and tested mode for this library is with unsafe optimizations disabled.
    bool unsafe_optimizations = false;

    /// This configured the optimization level LLVM optimizes generated code at. The higher
    /// the optimization level, the longer the time recompilation takes but the faster the
    /// generate code.
    /// This pretty much corresponds to optimization levels used when compiling C or C++
    /// code, and O2 is usually a good middle-ground between compilation time and runtime
    /// speed.
    /// Os optimizes more for low code size (thus lower memory usage) while Oz
    /// attempts to achieve low code size at all costs.
    /// Disabling the LLVMIROpt optimization flag causes this option to be ignored.
    LLVMOptimizationLevel llvm_opt_level = LLVMOptimizationLevel::O2;

    /// When set to true, Dynautic will attempt to continue in unexpected situations (mostly
    /// those created by unsafe optimizations or incorrect imlementation) instead of raising
    /// an UnpredictableInstruction exception. Assertions may still trigger if enabled
    bool unsafe_unexpected_situation_handling = false;

    /// When set to true, UserCallbacks::DataCacheOperationRaised will be called when any
    /// data cache instruction is executed. Notably DC ZVA will not implicitly do anything.
    /// When set to false, UserCallbacks::DataCacheOperationRaised will never be called.
    /// Executing DC ZVA in this mode will result in zeros being written to memory.
    bool hook_data_cache_operations = false;

    /// When set to true, cache will be updated. This will decrease performance at the cost
    /// of generating cache entries that may be used for great performance increases with
    /// use_cache enabled later on.
    bool update_cache = false;

    /// When set to true, cache will be used to generate more optimized code. This is only
    /// useful when cache entries previously generated with update_cache enabled are loaded.
    /// Requires BlockLinking optimization.
    bool use_cache = true;

    /// When set to true, no dynamic code generation is performed. This leads to optimal
    /// performance when using cache data, but will crash when executing any code that hasn't
    /// been cached and needs dynamic compilation. Requires unsafe_optimizations and
    /// use_cache.
    bool fully_static = false;

    /// When set to true, UserCallbacks::InstructionSynchronizationBarrierRaised will be
    /// called when an ISB instruction is executed.
    /// When set to false, ISB will be treated as a NOP instruction.
    bool hook_isb = false;

    /// When set to true, UserCallbacks::ExceptionRaised will be called when any hint
    /// instruction is executed.
    bool hook_hint_instructions = false;

    /// When set to true, any generated assembly is dumped to console. This is useful for
    /// debugging purposes only.
    bool dump_assembly = false;

    /// Counter-timer frequency register. The value of the register is not interpreted by
    /// Dynautic.
    std::uint32_t cntfrq_el0 = 600000000;

    /// CTR_EL0<27:24> is log2 of the cache writeback granule in words.
    /// CTR_EL0<23:20> is log2 of the exclusives reservation granule in words.
    /// CTR_EL0<19:16> is log2 of the smallest data/unified cacheline in words.
    /// CTR_EL0<15:14> is the level 1 instruction cache policy.
    /// CTR_EL0<3:0> is log2 of the smallest instruction cacheline in words.
    std::uint32_t ctr_el0 = 0x8444c004;

    /// DCZID_EL0<3:0> is log2 of the block size in words
    /// DCZID_EL0<4> is 0 if the DC ZVA instruction is permitted.
    std::uint32_t dczid_el0 = 4;

    /// Pointer to where TPIDRRO_EL0 is stored. This pointer will be inserted into
    /// emitted code.
    const std::uint64_t* tpidrro_el0 = nullptr;

    /// Pointer to where TPIDR_EL0 is stored. This pointer will be inserted into
    /// emitted code.
    std::uint64_t* tpidr_el0 = nullptr;

//    /// Pointer to the page table which we can use for direct page table access.
//    /// If an entry in page_table is null, the relevant memory callback will be called.
//    /// If page_table is nullptr, all memory accesses hit the memory callbacks.
//    void** page_table = nullptr;
//    /// Declares how many valid address bits are there in virtual addresses.
//    /// Determines the size of page_table. Valid values are between 12 and 64 inclusive.
//    /// This is only used if page_table is not nullptr.
//    size_t page_table_address_space_bits = 36;
//    /// Masks out the first N bits in host pointers from the page table.
//    /// The intention behind this is to allow users of Dynautic to pack attributes in the
//    /// same integer and update the pointer attribute pair atomically.
//    /// If the configured value is 3, all pointers will be forcefully aligned to 8 bytes.
//    int page_table_pointer_mask_bits = 0;
//    /// Determines what happens if the guest accesses an entry that is off the end of the
//    /// page table. If true, Dynautic will silently mirror page_table's address space. If
//    /// false, accessing memory outside of page_table bounds will result in a call to the
//    /// relevant memory callback.
//    /// This is only used if page_table is not nullptr.
//    bool silently_mirror_page_table = true;
//    /// Determines if the pointer in the page_table shall be offseted locally or globally.
//    /// 'false' will access page_table[addr >> bits][addr & mask]
//    /// 'true'  will access page_table[addr >> bits][addr]
//    /// Note: page_table[addr >> bits] will still be checked to verify active pages.
//    ///       So there might be wrongly faulted pages which maps to nullptr.
//    ///       This can be avoided by carefully allocating the memory region.
//    bool absolute_offset_page_table = false;
//    /// Determines if we should detect memory accesses via page_table that straddle are
//    /// misaligned. Accesses that straddle page boundaries will fallback to the relevant
//    /// memory callback.
//    /// This value should be the required access sizes this applies to ORed together.
//    /// To detect any access, use: 8 | 16 | 32 | 64 | 128.
//    std::uint8_t detect_misaligned_access_via_page_table = 0;
//    /// Determines if the above option only triggers when the misalignment straddles a
//    /// page boundary.
//    bool only_detect_misalignment_via_page_table_on_page_boundary = false;

//    /// Fastmem Pointer
//    /// This should point to the beginning of a 2^page_table_address_space_bits bytes
//    /// address space which is in arranged just like what you wish for emulated memory to
//    /// be. If the host page faults on an address, the JIT will fallback to calling the
//    /// MemoryRead*/MemoryWrite* callbacks.
//    std::optional<uintptr_t> fastmem_pointer = std::nullopt;
//    /// Determines if instructions that pagefault should cause recompilation of that block
//    /// with fastmem disabled.
//    /// Recompiled code will use the page_table if this is available, otherwise memory
//    /// accesses will hit the memory callbacks.
//    bool recompile_on_fastmem_failure = true;
//    /// Declares how many valid address bits are there in virtual addresses.
//    /// Determines the size of fastmem arena. Valid values are between 12 and 64 inclusive.
//    /// This is only used if fastmem_pointer is set.
//    size_t fastmem_address_space_bits = 36;
//    /// Determines what happens if the guest accesses an entry that is off the end of the
//    /// fastmem arena. If true, Dynautic will silently mirror fastmem's address space. If
//    /// false, accessing memory outside of fastmem bounds will result in a call to the
//    /// relevant memory callback.
//    /// This is only used if fastmem_pointer is set.
//    bool silently_mirror_fastmem = true;

//    /// Determines if we should use the above fastmem_pointer for exclusive reads and
//    /// writes. On x64, Dynautic currently relies on x64 cmpxchg semantics which may not
//    /// provide fully accurate emulation.
//    bool fastmem_exclusive_access = false;
//    /// Determines if exclusive access instructions that pagefault should cause
//    /// recompilation of that block with fastmem disabled. Recompiled code will use memory
//    /// callbacks.
//    bool recompile_on_exclusive_fastmem_failure = true;

    /// HACK:
    /// This tells the translator a wall clock will be used, thus allowing it
    /// to avoid writting certain unnecessary code only needed for cycle timers.
    bool wall_clock_cntpct = false;

    /// This allows accurately emulating protection fault handlers. If true, we check
    /// for exit after every data memory access by the emulated program.
    bool check_halt_on_memory_access = false;

    /// This option allows you to disable cycle counting. If this is set to false,
    /// AddTicks and GetTicksRemaining are never called, and no cycle counting is done.
    bool enable_cycle_counting = true;

    /// Internal use only
    bool very_verbose_debugging_output = false;
};

class Runtime {
public:
    explicit Runtime(UserConfig conf);
    ~Runtime();

    Runtime(const Runtime&) = delete;
    Runtime(Runtime&&) = delete;

    /**
     * Runs the emulated CPU.
     * Cannot be recursively called.
     */
    HaltReason Run();

    /**
     * Step the emulated CPU for one tick.
     * Cannot be recursively called.
     */
    HaltReason Step();

    /**
     * Reset CPU state to state at startup. Does not clear code cache.
     * Cannot be called from a callback.
     */
    void Reset();

    /**
     * Clears the code cache of all compiled code.
     * Can be called at any time. Halts execution if called within a callback.
     */
    void ClearCache();

    /**
     * Stops execution in Jit::Run.
     */
    void HaltExecution(HaltReason hr = HaltReason::UserDefined1);

    /**
     * Clears a halt reason from flags.
     * Warning: Only use this if you're sure this won't introduce races.
     */
    void ClearHalt(HaltReason hr = HaltReason::UserDefined1);

    /// Read Stack Pointer
    std::uint64_t GetSP() const;
    /// Modify Stack Pointer
    void SetSP(std::uint64_t value);

    /// Read Program Counter
    std::uint64_t GetPC() const;
    /// Modify Program Counter
    void SetPC(std::uint64_t value);

    /// Read general-purpose register.
    std::uint64_t GetRegister(std::size_t index) const;
    /// Modify general-purpose register.
    void SetRegister(size_t index, std::uint64_t value);

    /// Read all general-purpose registers.
    std::array<std::uint64_t, 31> GetRegisters() const;
    /// Modify all general-purpose registers.
    void SetRegisters(const std::array<std::uint64_t, 31>& value);

    /// Read floating point and SIMD register.
    Vector GetVector(std::size_t index) const;
    /// Modify floating point and SIMD register.
    void SetVector(std::size_t index, Vector value);

    /// Read all floating point and SIMD registers.
    std::array<Vector, 32> GetVectors() const;
    /// Modify all floating point and SIMD registers.
    void SetVectors(const std::array<Vector, 32>& value);

    /// View FPCR.
    std::uint32_t GetFpcr() const;
    /// Modify FPCR.
    void SetFpcr(std::uint32_t value);

    /// View FPSR.
    std::uint32_t GetFpsr() const;
    /// Modify FPSR.
    void SetFpsr(std::uint32_t value);

    /// View PSTATE
    std::uint32_t GetPstate() const;
    /// Modify PSTATE
    void SetPstate(std::uint32_t value);

    /// Clears exclusive state for this core.
    void ClearExclusiveState();

    /// Dumps cache for later use.
    std::vector<uint64_t> DumpCache() const;

    /// Restores cache. Replaces existing contents.
    void LoadCache(const std::vector<uint64_t>&);

    /**
     * Returns true if Jit::Run was called but hasn't returned yet.
     * i.e.: We're in a callback.
     */
    bool IsExecuting() const;

    /*
     * Disassemble the instructions following the current pc and return
     * the resulting instructions as a vector of their string representations.
     */
    std::vector<std::string> Disassemble() const;

    /*
     * Opaque runtime implementation pointer. For internal use only.
     */
    struct Impl;
    Impl* impl;
};

}  // namespace Dynautic::A64
