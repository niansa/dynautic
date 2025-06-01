#pragma once

#include "../globalmonitor.hpp"
#include "../llvm.hpp"
#include "../timer.hpp"
#include "cache.hpp"
#include "lifter.hpp"

#include "../minicoro.h"

#include <dynautic/A64.hpp>
#include <memory>
#include <unordered_map>

namespace Dynautic::A64 {
class ExecutionContext {
    mco_coro *coro = nullptr;

    void Call(const llvm::orc::ExecutorAddr&);

public:
    ExecutionContext() {}
    ~ExecutionContext() {
        if (Exists())
            Destroy();
    }

    void Create(const llvm::orc::ExecutorAddr&);
    void Destroy();

    void Yield() { mco_yield(coro); }
    void Resume() {
        mco_resume(coro);
        if (mco_status(coro) == MCO_DEAD)
            Destroy();
    }

    bool Exists() const { return coro != nullptr; }
};

struct Runtime::Impl {
    Runtime *parent;

    GlobalMonitor *monitor = nullptr;
    ExecutionContext exc;
    bool executing = false;
    HaltReason halt_reason;
    VAddr pc;

    Lifter lifter;
    UserConfig conf;
    Cache cache;
    Timer lastCompile;

    std::unique_ptr<llvm::orc::LLJIT> jit;

    Impl(UserConfig, Runtime *);

    bool IsOk() const { return jit != nullptr; }

    /// Enforces configuration constraints.
    void EnforceConfigConstraints();

    /// Recreates JIT. Updates IsOk() state.
    void CreateJit();

    /// Create new globals. Called by CreateJit(). Updates IsOk() state.
    void CreateGlobals();

    /// Dump CPU state from globals.
    StateDump DumpState();

    /// Restore CPU state into globals.
    void RestoreState(const StateDump&);

    /// Periodically called from generated code, may yield execution.
    void CheckHalt();

    /// Clear caches.
    void ClearCache();

    /// Clear JIT
    void ClearJIT();

    static std::uint8_t MemoryRead8(Runtime::Impl&, VAddr vaddr);
    static std::uint16_t MemoryRead16(Runtime::Impl&, VAddr vaddr);
    static std::uint32_t MemoryRead32(Runtime::Impl&, VAddr vaddr);
    static std::uint64_t MemoryRead64(Runtime::Impl&, VAddr vaddr);
    static Vector MemoryRead128(Runtime::Impl&, VAddr vaddr);

    static void MemoryWrite8(Runtime::Impl&, VAddr vaddr, std::uint8_t);
    static void MemoryWrite16(Runtime::Impl&, VAddr vaddr, std::uint16_t);
    static void MemoryWrite32(Runtime::Impl&, VAddr vaddr, std::uint32_t);
    static void MemoryWrite64(Runtime::Impl&, VAddr vaddr, std::uint64_t);
    static void MemoryWrite128(Runtime::Impl&, VAddr vaddr, Vector);
};
} // namespace Dynautic::A64
