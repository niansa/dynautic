#ifndef LIFTER_INSTRUCTIONS_HPP
#define LIFTER_INSTRUCTIONS_HPP
#include "lifter.hpp"

#include <array>
#include <capstone/capstone.h>
#include <vector>

namespace Dynautic::A64 {
class Lifter::InstructionLifter {
    constexpr static unsigned GetOps_max_op_count = 4;

    Lifter& p;
    Lifter::Instance& rinst;

    const std::vector<VAddr>& noexec_addrs;

    const cs_insn& insn;
    const cs_aarch64& detail;

    std::array<bool, 8> extra_flags{};

    uint8_t shift = 0;
    aarch64_shifter shift_type = AArch64_SFT_INVALID;

    uint64_t GetImm(const cs_aarch64_op& op);
    uint16_t GetImm16WithShift(uint64_t value);
    RegisterDescription GetImmAsReg(const cs_aarch64_op& op, bool as_word);

    std::array<RegisterDescription, GetOps_max_op_count> GetOps(unsigned op_count);

    llvm::Value *ToInt1(llvm::Value *, bool invert = false);
    llvm::Value *GetNZCVCondition();
    llvm::Value *GetComparisonCondition();
    llvm::Value *GetCondition();
    void SetComparison(llvm::Value *a, llvm::Value *b);
    void SetNZCV(llvm::Value *value);
    void SetNZFromInt(llvm::Value *value);
    void SetZFromInt(llvm::Value *value);
    llvm::Value *GetN(llvm::Value *value);
    llvm::Value *GetZ(llvm::Value *value);
    llvm::Value *GetC(llvm::Value *value);
    llvm::Value *GetV(llvm::Value *value);
    void SetNZCV(llvm::Value *n, llvm::Value *z, llvm::Value *c = nullptr, llvm::Value *v = nullptr);
    void SetNZCVIf(llvm::Value *value, llvm::Value *condition);

    void CreateCall(unsigned op_idx = 0);
    llvm::BasicBlock *PrepareBranch(unsigned op_idx = 0);

    llvm::Value *GetMemOpReference(bool unscaled, unsigned op_idx = 1);

    enum LoadStoreFlags { unscaled, signed_, byte, half_word, word, exclusive, release };
    uint8_t GetLoadStoreFlagsAndSize(uint64_t insn_id);

    void DeferCompilation(bool repeat_instruction = false);

    bool BaseInstructions(uint64_t id);
    bool VectorInstructions(uint64_t id);
    bool FloatingPointInstructions(uint64_t id);

public:
    InstructionLifter(Lifter& parent, Lifter::Instance& rinst, const cs_insn& insn, const std::vector<VAddr>& noexec_addrs = {})
        : p(parent), rinst(rinst), noexec_addrs(std::move(noexec_addrs)), insn(insn), detail(insn.detail->aarch64) {
        p.ResetScratchRegisters();
    }

    bool Run(bool first_instruction);
};
} // namespace Dynautic::A64

#endif // LIFTER_INSTRUCTIONS_HPP
