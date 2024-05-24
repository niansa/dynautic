#pragma once

#include "../llvm.hpp"

#include <string>
#include <string_view>
#include <queue>
#include <optional>
#include <dynautic/A64.hpp>
#include <capstone/capstone.h>


namespace Dynautic::A64 {
struct RegisterDescription {
    enum class Type {
        invalid,
        scratch,
        general,
        vector,
        stack_pointer
    } type = Type::invalid;

    enum Size : uint8_t {
        single = 32,
        word = 32,
        double_ = 64,
        double_word = 64,
        quad = 128
    };
    uint8_t size = Size::double_word;

    int idx;

    RegisterDescription() {}
    RegisterDescription(const char *name);
    RegisterDescription(csh handle, aarch64_reg reg);
    RegisterDescription(unsigned scratchIdx, bool isWord) : type(Type::scratch), size(isWord?Size::word:Size::double_word), idx(scratchIdx) {}

    bool operator==(RegisterDescription o) const {
        return idx == o.idx && size == o.size && type == o.type;
    }
    bool operator!=(RegisterDescription o) const {
        return idx != o.idx || size != o.size || type != o.type;
    }

    uint8_t GetFullTypeSize() const {
        switch (type) {
        case Type::scratch: return 128;
        case Type::general: return 64;
        case Type::vector: return 128;
        case Type::stack_pointer: return 64;
        default: {
            DYNAUTIC_ASSERT(!"Invalid register type");
            return 0;
        }
        }
    }

    std::string GetName() const;

    bool IsZero() const {
        return idx < 0;
    }
};


class Lifter {
    class Instance;
    class InstructionLifter;

    csh cs_handle;

    std::queue<VAddr> queued_functions;

    struct RuntimeValues {
        bool dirty{};
        std::array<llvm::Value *, 4> scratch_registers;
        std::array<llvm::Value *, 31> registers;
        std::array<bool, 31> dirty_registers{};
        std::array<llvm::Value *, 32> vectors;
        std::array<bool, 32> dirty_vectors{};
        llvm::Value *stack_pointer;
        bool dirty_stack_pointer{};
        std::pair<llvm::Value *, llvm::Value *> comparison;
        bool dirty_comparison{};
        llvm::Value *nzcv;
        bool dirty_nzcv{};
        llvm::Value *exclusive_monitor{};
    } rt_values, rt_allocas;

    void ResetScratchRegisters();
    RegisterDescription AllocateScratchRegister(bool as_word);

    llvm::TypeSize GetTypeSizeInBits(Instance&, llvm::Type *);

    llvm::Value *&GetRawRegister(RegisterDescription, bool allow_overwrite);
    llvm::Value *GetRegisterView(Instance&, RegisterDescription, bool allow_vector = false);
    llvm::Value *StoreRegister(Instance&, RegisterDescription, llvm::Value *, aarch64_shifter shift_type = AArch64_SFT_INVALID, uint8_t shift = 0);
    llvm::Value *StoreRegister16(Instance&, RegisterDescription, uint16_t value, bool keep, aarch64_shifter shift_type = AArch64_SFT_INVALID, uint8_t shift = 0);

    llvm::Value *PerformShift(Instance&, llvm::Value *, aarch64_shifter type, llvm::Value *shift);
    llvm::Value *PerformShift(Instance&, llvm::Value *, aarch64_shifter type, uint8_t shift);
    uint64_t PerformShift(uint64_t, uint8_t bits, aarch64_shifter type, uint8_t shift);

    void LoadBranchContext(Instance&);
    void FinalizeBranchContext(Instance&);
    void LoadFunctionContext(Instance&, bool new_allocas = false);
    void FinalizeFunctionContext(Instance&);
    void UndirtyFunctionContext();
    void CreatePCSave(Instance&);

    static llvm::Value *CreateLoadFromGlobal(Instance& rinst, llvm::StringRef global_name, llvm::Type *type);
    static void CreateLoadFromGlobalIntoPtr(Instance& rinst, llvm::StringRef global_name, llvm::Type *type, llvm::Value *ptr);
    static void CreateStoreToGlobal(Instance& rinst, llvm::StringRef global_name, llvm::Value *value);

    static llvm::Value *CreateLoadFromPtr(Instance& rinst, const void *, llvm::Type *type, const llvm::Twine& name = "");
    static void CreateStoreToPtr(Instance& rinst, void *, llvm::Value *value);
    llvm::Value *CreateMemoryLoad(Instance&, llvm::Value *address, llvm::Type *, uint8_t alignment = 0);
    void CreateMemoryStore(Instance&, llvm::Value *address, llvm::Value *data, bool volatile_ = false, uint8_t alignment = 0);

    void CreateCall(Instance&, VAddr origin, llvm::Value *address, bool no_cache = false);
    void CreateCall(Instance&, VAddr origin, VAddr address);
    llvm::BasicBlock *PrepareBranch(Instance&, VAddr origin, llvm::Value *address);
    llvm::BasicBlock *PrepareBranch(Instance&, VAddr address);
    void CreateBranch(Instance&, llvm::BasicBlock *);
    void CreateConditionalBranch(Instance&, llvm::BasicBlock *true_, llvm::BasicBlock *false_, llvm::Value *condition);

    void CreateUseDynamicBranchCache(Instance&, VAddr origin, llvm::Value *addr);

    void CreateLiftTrampolineBlock(Instance&, VAddr origin, bool no_cache = false);
    void CreateLiftTrampoline(Instance&, VAddr origin, llvm::Value *addr, bool no_cache = false);
    void CreateSvcTrampoline(Instance&, uint32_t swi);
    void CreateExceptionTrampoline(Instance&, Exception);
    void CreateFreezeTrampoline(Instance&);
    void CreateExclusiveMonitorTagTrampoline(Instance&, llvm::Value *addr);
    void CreateExclusiveMonitorUntagTrampoline(Instance&, llvm::Value *addr);
    void CreateExclusiveMonitorPoisonTrampoline(Instance&, llvm::Value *addr);
    llvm::Value *CreateExclusiveMonitorIsPoisonedTrampoline(Instance&, llvm::Value *addr);
    void CreateDebugPrintTrampoline(Instance&, const char *message);

    static llvm::FunctionCallee GetMemoryRead(Instance&, uint8_t bits);
    static llvm::FunctionCallee GetMemoryWrite(Instance&, uint8_t bits);
    static llvm::FunctionCallee GetLiftTrampoline(Instance&);
    static llvm::FunctionCallee GetSvcTrampoline(Instance&);
    static llvm::FunctionCallee GetExceptionTrampoline(Instance&);
    static llvm::FunctionCallee GetUpdateExecutionStateTrampoline(Instance&);
    static llvm::FunctionCallee GetCreateDynamicBranchEntryTrampoline(Instance&);
    static llvm::FunctionCallee GetFreezeTrampoline(Instance&);
    static llvm::FunctionCallee GetExclusiveMonitorTagTrampoline(Instance&);
    static llvm::FunctionCallee GetExclusiveMonitorUntagTrampoline(Instance&);
    static llvm::FunctionCallee GetExclusiveMonitorPoisonTrampoline(Instance&);
    static llvm::FunctionCallee GetExclusiveMonitorIsPoisonedTrampoline(Instance&);
#ifdef ENABLE_RUNTIME_DEBUG_MESSAGES
    static llvm::FunctionCallee GetDebugPrintTrampoline(Instance&);

#endif
    void OptimizeModule(llvm::Module&);

    void LiftLeaf(Instance&, VAddr addr);
    bool LiftInstruction(Instance&, const cs_insn&, const std::vector<VAddr>& noexec_addrs = {});

    static std::string GetFunctionName(VAddr addr);

public:
    Runtime::Impl& rt;

    Lifter(Runtime::Impl& runtime);
    ~Lifter();

    bool IsOk() const {
        return cs_handle != 0;
    }

    static void SetupTrampolines(llvm::orc::LLJIT&);

    /// This function MUST NOT be called recursively
    std::optional<llvm::orc::ExecutorAddr> Lift(VAddr addr);
    void DeferLift(VAddr addr);

    static llvm::FunctionCallee GetLiftedFunction(Instance&, VAddr addr);
};
}
