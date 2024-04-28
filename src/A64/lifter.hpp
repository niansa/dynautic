#pragma once

#include "../llvm.hpp"

#include <string>
#include <string_view>
#include <list>
#include <optional>
#include <dynautic/A64.hpp>
#include <capstone/capstone.h>


namespace Dynautic::A64 {
struct RegisterDescription {
    enum class Type {
        invalid,
        scratch,
        general,
        stack_pointer
    } type = Type::invalid;

    bool isWord = false;
    bool integer = false;
    int idx;

    RegisterDescription() {}
    RegisterDescription(const char *name);
    RegisterDescription(csh handle, aarch64_reg reg);
    RegisterDescription(unsigned scratchIdx, bool isWord) : type(Type::scratch), isWord(isWord), integer(true), idx(scratchIdx) {}

    bool operator==(RegisterDescription o) const {
        return idx == o.idx && isWord == o.isWord && type == o.type;
    }
    bool operator!=(RegisterDescription o) const {
        return idx != o.idx || isWord != o.isWord || type != o.type;
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

    std::list<VAddr> pending;

    std::array<llvm::Value *, 4> scratch_registers;
    std::array<llvm::Value *, 31> registers;
    std::array<bool, 31> dirty_registers;
    std::array<llvm::Value *, 32> vectors;
    std::array<bool, 32> dirty_vectors;
    llvm::Value *stack_pointer;
    bool dirty_stack_pointer{};
    std::pair<llvm::Value *, llvm::Value *> comparison;
    bool dirty_comparison{};

    void ResetScratchRegisters();
    RegisterDescription AllocateScratchRegister(bool as_word);

    llvm::Value *&GetRawRegister(RegisterDescription, bool allowStoreTo);
    llvm::Value *GetRegisterView(Instance&, RegisterDescription);
    llvm::Value *StoreRegister(Instance&, RegisterDescription, llvm::Value *, aarch64_shifter shift_type = AArch64_SFT_INVALID, uint8_t shift = 0);
    llvm::Value *StoreRegister16(Instance&, RegisterDescription, uint16_t value, bool keep, aarch64_shifter shift_type = AArch64_SFT_INVALID, uint8_t shift = 0);

    llvm::Value *PerformShift(Instance&, llvm::Value *, aarch64_shifter type, llvm::Value *shift);
    llvm::Value *PerformShift(Instance&, llvm::Value *, aarch64_shifter type, uint8_t shift);
    uint64_t PerformShift(uint64_t, uint8_t bits, aarch64_shifter type, uint8_t shift);

    void CreateRegisterRestore(Instance&);
    void CreateRegisterSave(Instance&);
    void CreatePCSave(Instance&);

    static llvm::Value *CreateLoadFromPtr(Instance& rinst, void *, llvm::Type *type, const llvm::Twine& name = "");
    static void CreateStoreToPtr(Instance& rinst, void *, llvm::Value *value);

    llvm::Value *CreateMemoryLoad(Instance&, llvm::Value *address, llvm::Type *);
    void CreateMemoryStore(Instance&, llvm::Value *address, llvm::Value *data);

    void CreateCall(Instance&, VAddr origin, llvm::Value *address);
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

    static llvm::FunctionCallee GetMemoryRead(Instance&, uint8_t bits);
    static llvm::FunctionCallee GetMemoryWrite(Instance&, uint8_t bits);
    static llvm::FunctionCallee GetLiftTrampoline(Instance&);
    static llvm::FunctionCallee GetSvcTrampoline(Instance&);
    static llvm::FunctionCallee GetExceptionTrampoline(Instance&);
    static llvm::FunctionCallee GetUpdateExecutionStateTrampoline(Instance&);
    static llvm::FunctionCallee GetCreateDynamicBranchEntryTrampoline(Instance&);
    static llvm::FunctionCallee GetFreezeTrampoline(Instance&);

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
    bool IsLiftPending(VAddr addr) {
        for (const VAddr pending_addr : pending)
            if (addr == pending_addr)
                return true;
        return false;
    }

    static void SetupTrampolines(llvm::orc::LLJIT&);

    static llvm::FunctionCallee GetLiftedFunction(Instance&, VAddr addr);

    std::optional<llvm::orc::ExecutorAddr> Lift(VAddr addr, bool no_cache = false);
};
}
