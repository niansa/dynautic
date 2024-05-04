#pragma once

#include "lifter.hpp"
#include "cache.hpp"
#include "../llvm.hpp"

#include "../minicoro.h"

#include <memory>
#include <unordered_map>
#include <dynautic/A64.hpp>



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

    void Yield() {
        mco_yield(coro);
    }
    void Resume() {
        mco_resume(coro);
        if (mco_status(coro) == MCO_DEAD)
            Destroy();
    }

    bool Exists() const {
        return coro != nullptr;
    }
};


struct Runtime::Impl {
    Runtime *parent;

    ExecutionContext exc;
    bool executing = false;
    HaltReason halt_reason;

    VAddr PC = 0,
        SP = 0;
    std::array<uint64_t, 31> registers{};
    std::array<Vector, 32> vectors{};
    std::pair<uint64_t, uint64_t> comparison{};
    uint8_t nzcv{};

    Lifter raiser;
    UserConfig conf;
    Cache cache;

    std::unique_ptr<llvm::orc::LLJIT> jit;

    Impl(UserConfig, Runtime *);

    bool IsOk() const {
        return jit != nullptr;
    }

    /// Recreates JIT. Updates IsOk() state.
    void CreateJit();

    /// Periodically called from generated code, may yield execution.
    void UpdateExecutionState();

    /// Clear caches.
    void ClearCache();

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
}
