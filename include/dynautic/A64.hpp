/* This file is part of the Dynarmic project.
 * Copyright (c) 2018 MerryMage
 * Copyright (c) 2024 niansa
 * SPDX-License-Identifier: 0BSD
 */

#pragma once

#include "common.hpp"
#include "optimization.hpp"

#include <array>
#include <cstdint>
#include <memory>
#include <optional>
#include <string>
#include <vector>

namespace Dynautic::A64 {
using VAddr = std::uint64_t;

using Vector = std::array<std::uint64_t, 2>;
static_assert(sizeof(Vector) == sizeof(std::uint64_t) * 2, "Vector must be 128 bits in size");

enum class Exception {
    /// An UndefinedFault occured due to executing instruction with an unallocated
    /// encoding
    UnallocatedEncoding,
    /// An UndefinedFault occured due to executing instruction containing a
    /// reserved value
    ReservedValue,
    /// An unpredictable instruction is to be executed. Implementation-defined
    /// behaviour should now happen.
    /// This behaviour is up to the user of this library to define.
    /// Note: Constraints on unpredictable behaviour are specified in the ARMv8
    /// ARM.
    UnpredictableInstruction,
    /// A WFI instruction was executed. You may now enter a low-power state. (Hint
    /// instruction.)
    WaitForInterrupt,
    /// A WFE instruction was executed. You may now enter a low-power state if the
    /// event register is clear. (Hint instruction.)
    WaitForEvent,
    /// A SEV instruction was executed. The event register of all PEs should be
    /// set. (Hint instruction.)
    SendEvent,
    /// A SEVL instruction was executed. The event register of the current PE
    /// should be set. (Hint instruction.)
    SendEventLocal,
    /// A YIELD instruction was executed. (Hint instruction.)
    Yield,
    /// A BRK instruction was executed. (Hint instruction.)
    Breakpoint,
    /// Attempted to execute a code block at an address for which MemoryReadCode
    /// returned std::nullopt.
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

    /// All reads through this callback are 4-byte aligned.
    /// Memory must be interpreted as little endian.
    virtual std::optional<std::uint32_t> MemoryReadCode(VAddr vaddr) { return MemoryRead32(vaddr); }

    /// Reads through these callbacks may not be aligned.
    virtual std::uint8_t MemoryRead8(VAddr vaddr) = 0;
    virtual std::uint16_t MemoryRead16(VAddr vaddr) = 0;
    virtual std::uint32_t MemoryRead32(VAddr vaddr) = 0;
    virtual std::uint64_t MemoryRead64(VAddr vaddr) = 0;
    virtual Vector MemoryRead128(VAddr vaddr) = 0;

    /// Writes through these callbacks may not be aligned.
    virtual void MemoryWrite8(VAddr vaddr, std::uint8_t value) = 0;
    virtual void MemoryWrite16(VAddr vaddr, std::uint16_t value) = 0;
    virtual void MemoryWrite32(VAddr vaddr, std::uint32_t value) = 0;
    virtual void MemoryWrite64(VAddr vaddr, std::uint64_t value) = 0;
    virtual void MemoryWrite128(VAddr vaddr, Vector value) = 0;

    /// If this callback returns true, the JIT will assume MemoryRead* callbacks
    /// will always return the same value at any point in time for this vaddr. The
    /// JIT may use this information in optimizations. A conservative
    /// implementation that always returns false is safe.
    virtual bool IsReadOnlyMemory(VAddr /*vaddr*/) { return false; }

    /// The interpreter must execute exactly num_instructions starting from PC.
    virtual void InterpreterFallback(VAddr pc, size_t num_instructions) = 0;

    /// This callback is called whenever an SVC instruction is executed.
    virtual void CallSVC(std::uint32_t swi) = 0;

    virtual void ExceptionRaised(VAddr pc, Exception exception) = 0;
    virtual void DataCacheOperationRaised(DataCacheOperation /*op*/, VAddr /*value*/) {}

    /// Timing-related callbacks
    /// ticks ticks have passed
    virtual void AddTicks(std::uint64_t ticks) = 0;
    /// How many more ticks am I allowed to execute?
    virtual std::uint64_t GetTicksRemaining() = 0;
    /// Get value in the emulated counter-timer physical count register.
    virtual std::uint64_t GetCNTPCT() = 0;
};

struct UserConfig {
    UserCallbacks *callbacks;

    /// All instances operating together in a multithreaded scenario sharing the a
    /// memory space must have the same system_id. system_ids should count up from
    /// 0.
    uint8_t system_id = 0;

    size_t processor_id = 0;

    /// This selects other optimizations than can't otherwise be disabled by
    /// setting other configuration options. This is intended to be used for
    /// debugging.
    OptimizationFlag optimizations = all_safe_optimizations;

    bool HasOptimization(OptimizationFlag f) const { return (f & optimizations) != no_optimizations; }

    /// This enables unsafe optimizations that reduce emulation accuracy in favour
    /// of speed. For safety, in order to enable unsafe optimizations you have to
    /// set BOTH this flag AND the appropriate flag bits above. The prefered and
    /// tested mode for this library is with unsafe optimizations disabled.
    bool unsafe_optimizations = false;

    /// This configured the optimization level LLVM optimizes generated code at.
    /// The higher the optimization level, the longer the time recompilation takes
    /// but the faster the generate code. This pretty much corresponds to
    /// optimization levels used when compiling C or C++ code, and O2 is usually a
    /// good middle-ground between compilation time and runtime speed. Os
    /// optimizes more for low code size (thus lower memory usage) while Oz
    /// attempts to achieve low code size at all costs.
    /// Disabling the LLVMIROpt optimization flag causes this option to be
    /// ignored.
    LLVMOptimizationLevel llvm_opt_level = LLVMOptimizationLevel::O2;

    /// When set to true, Dynautic will attempt to continue in unexpected
    /// situations (mostly those created by unsafe optimizations or incorrect
    /// imlementation) instead of raising an UnpredictableInstruction exception.
    /// Assertions may still trigger if enabled.
    bool unsafe_unexpected_situation_handling = false;

    /// When set to true, no memory access callbacks other than MemoryReadCode are
    /// called. Instead, memory accesses are translated to native memory accesses.
    /// Note that this allows the emulated code to hijack the rest of the
    /// application. Note that if this is enabled it is up to the operating system
    /// to handle access faults. The application is responsible for setting up
    /// handlers indepdently.
    bool native_memory = false;

    /// When set to true, UserCallbacks::DataCacheOperationRaised will be called
    /// when any data cache instruction is executed. Notably DC ZVA will not
    /// implicitly do anything. When set to false,
    /// UserCallbacks::DataCacheOperationRaised will never be called. Executing DC
    /// ZVA in this mode will result in zeros being written to memory.
    bool hook_data_cache_operations = false;

    /// When set to true, cache will be updated. This will decrease performance at
    /// the cost of generating cache entries that may be used for performance
    /// increases with use_cache enabled later on.
    bool update_cache = false;

    /// When set to true, cache will be used to generate more optimized code. This
    /// is only useful when cache entries previously generated with update_cache
    /// enabled are loaded. Note this will make initial compilation slow but
    /// happen much less frequently. Requires BlockLinking optimization.
    bool use_cache = true;

    /// When set to non-zero, all generated code is dropped after given amount of
    /// milliseconds of no code generation activity. This allows gradual
    /// optimization using cached data as code execution happens. This currently
    /// leads to regeneration and reoptimization of lots of previously generated
    /// code which may introduce stutter. This is useless without update_cache &&
    /// use_cache
    uint32_t periodic_recompile = 0;

    /// When set to true, no dynamic code generation is performed. This leads to
    /// optimal performance when using cache data, but will crash when executing
    /// any code that hasn't been cached and needs dynamic compilation. Requires
    /// unsafe_optimizations and use_cache.
    bool fully_static = false;

    /// When set to true, UserCallbacks::InstructionSynchronizationBarrierRaised
    /// will be called when an ISB instruction is executed. When set to false, ISB
    /// will be treated as a NOP instruction.
    bool hook_isb = false;

    /// When set to true, UserCallbacks::ExceptionRaised will be called when any
    /// hint instruction is executed.
    bool hook_hint_instructions = false;

    /// When set to true, any generated assembly is dumped to console. This is
    /// useful for debugging purposes only.
    bool dump_assembly = false;

    /// Counter-timer frequency register. The value of the register is not
    /// interpreted by Dynautic.
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
    const std::uint64_t *tpidrro_el0 = nullptr;

    /// Pointer to where TPIDR_EL0 is stored. This pointer will be inserted into
    /// emitted code.
    std::uint64_t *tpidr_el0 = nullptr;

    /// HACK:
    /// This tells the translator a wall clock will be used, thus allowing it
    /// to avoid writting certain unnecessary code only needed for cycle timers.
    bool wall_clock_cntpct = false;

    /// This allows accurately emulating protection fault handlers. If true, we
    /// check for exit after every data memory access by the emulated program.
    /// Useless if combined with native_memory.
    bool check_halt_on_memory_access = false;

    /// This option allows you to disable cycle counting. If this is set to false,
    /// AddTicks and GetTicksRemaining are never called, and no cycle counting is
    /// done.
    bool enable_cycle_counting = true;

    /// Internal use only
    bool very_verbose_debugging_output = false;
};

using RawStateDump = std::vector<uint8_t>;

class StateDump {
    static constexpr unsigned program_counter = 8, stack_pointer = 8, general_regs = 31 * 8, vector_regs = 32 * 16, comparison = 8 * 2, nzcv = 1;
    static constexpr unsigned program_counter_off = 0, stack_pointer_off = program_counter_off + program_counter,
                              general_regs_off = stack_pointer_off + stack_pointer, vector_regs_off = general_regs_off + general_regs,
                              comparison_off = vector_regs_off + vector_regs, nzcv_off = comparison_off + comparison;
    RawStateDump raw;

public:
    StateDump() : raw(nzcv_off + nzcv) {}
    StateDump(const RawStateDump& o) : raw(o) {}
    StateDump(RawStateDump&& o) : raw(std::move(o)) {}

    uint64_t& GetProgramCounter() { return *reinterpret_cast<uint64_t *>(&raw[program_counter_off]); }
    uint64_t& GetStackPointer() { return *reinterpret_cast<uint64_t *>(&raw[stack_pointer_off]); }
    uint64_t *GetGeneralRegs() { return reinterpret_cast<uint64_t *>(&raw[general_regs_off]); }
    Vector *GetVectorRegs() { return reinterpret_cast<Vector *>(&raw[vector_regs_off]); }
    uint64_t *GetComparison() { return reinterpret_cast<uint64_t *>(&raw[comparison_off]); }
    uint8_t& GetNZCV() { return *reinterpret_cast<uint8_t *>(&raw[nzcv_off]); }

    uint64_t GetProgramCounter() const { return *reinterpret_cast<const uint64_t *>(&raw[program_counter_off]); }
    uint64_t GetStackPointer() const { return *reinterpret_cast<const uint64_t *>(&raw[stack_pointer_off]); }
    const uint64_t *GetGeneralRegs() const { return reinterpret_cast<const uint64_t *>(&raw[general_regs_off]); }
    const Vector *GetVectorRegs() const { return reinterpret_cast<const Vector *>(&raw[vector_regs_off]); }
    const uint64_t *GetComparison() const { return reinterpret_cast<const uint64_t *>(&raw[comparison_off]); }
    uint8_t GetNZCV() const { return *reinterpret_cast<const uint8_t *>(&raw[nzcv_off]); }

    const RawStateDump& GetRaw() const { return raw; }
    RawStateDump&& MoveRaw() { return std::move(raw); }
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
     * Clears the code cache and all compiled code.
     * Can be called at any time. Calling this within a callback will cause a halt
     * after which the CPU state will be invalid! To prevent state invalidation,
     * call outside callback.
     */
    void ClearCache();

    /**
     * Clears all compiled code.
     * Can be called at any time. Calling this within a callback will cause a halt
     * after which the CPU state will be invalid! To prevent state invalidation,
     * call outside callback.
     */
    void ClearJIT();

    /**
     * Stops execution in Jit::Run.
     */
    void HaltExecution(HaltReason hr = HaltReason::UserDefined1);

    /**
     * Clears a halt reason from flags.
     * Warning: Only use this if you're sure this won't introduce races.
     */
    void ClearHalt(HaltReason hr = HaltReason::UserDefined1);

    /// Dump all CPU state
    StateDump DumpState();

    /// Restore CPU state dump
    void RestoreState(const StateDump&);

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
    void SetRegisters(const std::array<std::uint64_t, 31>& values);

    /// Read floating point and SIMD register.
    Vector GetVector(std::size_t index) const;
    /// Modify floating point and SIMD register.
    void SetVector(std::size_t index, Vector value);

    /// Read all floating point and SIMD registers.
    std::array<Vector, 32> GetVectors() const;
    /// Modify all floating point and SIMD registers.
    void SetVectors(const std::array<Vector, 32>& values);

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
    Impl *impl;
};

} // namespace Dynautic::A64
