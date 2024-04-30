#include "lifter.hpp"
#include "runtime.hpp"
#include "lifter_instance.hpp"
#include "lifter_instructions.hpp"
#include "../llvm.hpp"

#include <string>
#include <vector>
#include <memory>
#include <optional>
#include <array>
#include <dynautic/A64.hpp>
#include <capstone/capstone.h>

using namespace llvm;
using namespace llvm::orc;


namespace Dynautic::A64 {
Lifter::Lifter(Runtime::Impl& runtime)
      : rt(runtime) {
    if (cs_open(CS_ARCH_AARCH64, CS_MODE_LITTLE_ENDIAN, &cs_handle) != CS_ERR_OK) {
        cs_handle = 0;
    } else {
        cs_option(cs_handle, CS_OPT_DETAIL, CS_OPT_ON);
        cs_option(cs_handle, CS_OPT_UNSIGNED, CS_OPT_ON);
    }
}

Lifter::~Lifter() {
    if (cs_handle)
        cs_close(&cs_handle);
}

std::string Lifter::GetFunctionName(VAddr addr) {
    return "FncAt"+std::to_string(addr);
}

FunctionCallee Lifter::GetLiftedFunction(Instance& rinst, VAddr addr) {
    return rinst.DeclareFunction(GetFunctionName(addr));
}

std::optional<ExecutorAddr> Lifter::Lift(VAddr addr, bool allow_nested) {
    DYNAUTIC_ASSERT(IsOk() && rt.jit);

    if (IsLiftPending(addr))
        return {};

    // Get module name
    const std::string function_name = GetFunctionName(addr);

    // Try existing functions in compiled modules first
    if (auto executor_addr = rt.jit->lookup(function_name))
        return executor_addr.get();

    // Check if nested
    const bool nested = top_instance != nullptr;
    DYNAUTIC_ASSERT(!(nested && !allow_nested));

    // Set up context and module
    std::unique_ptr<LLVMContext> unique_context;
    std::unique_ptr<Module> unique_module;
    LLVMContext *context;
    Module *module;

    if (!nested) {
        // Create context
        unique_context = std::make_unique<LLVMContext>();
        context = unique_context.get();

        // Create new module
        unique_module = std::make_unique<Module>("ModuleAt"+std::to_string(addr), *context);
        module = unique_module.get();
    } else {
        // Copy context and module from top instance
        context = top_instance->context;
        module = top_instance->module;

        // Try exiting functions in current module first
        if (module->getFunction(function_name))
            return {};
    }

    // Create entry block and branch
    Instance rinst(rt, context, module, function_name);
    rinst.QueueBranch(addr, "EntryBlock");

    // Set as top instance if not nested
    if (!nested)
        top_instance = &rinst;

    // Lift each leaf until none are left
    pending.push_back(addr);
    while (rinst.NextBranch()) {
        if (!rinst.IsDynamicBranch()) {
            // Lift leaf with known address
            LiftLeaf(rinst, rinst.GetBranchAddr());
        } else {
            CreateLiftTrampolineBlock(rinst, rinst.GetBranchOrigin());
        }
    }
    pending.remove(addr);

    // Finalize module only if not nested
    if (!nested) {
        top_instance = nullptr;

        // Dump generated IR if enabled
        if (rt.conf.dump_assembly)
            outs() << *module;

        #ifdef ENABLE_LLVM_VALIDATION
        // Run verifier
        VerifierAnalysis verifier;
        ModuleAnalysisManager analysisManager;
        auto verifierResult = verifier.run(*module, analysisManager);
        if (verifierResult.IRBroken)
            errs() << "Module is broken!\n";

        #endif
        // Add module to JIT
        auto error = rt.jit->addIRModule(ThreadSafeModule(std::move(unique_module), std::move(unique_context)));
        if (error) {
            errs() << "Failed to add module: " << error << '\n';
            return {};
        }

        // Look up added function and return address
        return rt.jit->lookup(function_name).get();
    }

    // Return nothing since we're nested
    return {};
}

void Lifter::LiftLeaf(Instance& rinst, VAddr addr) {
    VAddr last_addr = addr;
    std::vector<VAddr> noexec_addrs;

    CreateRegisterRestore(rinst);

    // Lift instructions in blocks
    std::array<uint8_t, 0x100> block;
    static_assert((block.size()%4) == 0);
    for (bool stop = false; !stop; addr += block.size()) {
        // Read block
        for (unsigned off = 0; off != block.size(); off += 4) {
            uint32_t& instr = *reinterpret_cast<uint32_t*>(&block[off]);
            const auto opt = rt.conf.callbacks->MemoryReadCode(addr+off);
            if (opt.has_value()) {
                instr = opt.value();
            } else {
                noexec_addrs.push_back(addr+off);
                instr = 0xffffffff;
            }
        }

        // Disassemble instructions
        cs_insn *insns;
        const auto count = cs_disasm(cs_handle, block.data(), block.size(), addr, 0, &insns);

        // Lift all instructions
        for (unsigned i = 0; i != count; ++i) {
            if (!LiftInstruction(rinst, insns[i]) || rinst.block_terminated) {
                stop = true;
                break;
            }
        }

        // Save last address for later
        if (count != 0)
            last_addr = insns[count-1].address + 4;

        // Clean up disassembly
        cs_free(insns, count);

        // Stop if instruction count is not max
        if (count != block.size()/4)
            break;
    }

    // Lift undefined instruction if block hasn't been terminated
    if (!rinst.block_terminated) {
        cs_insn insn;
        insn.id = AArch64_INS_UDF;
        insn.address = last_addr;
        LiftInstruction(rinst, insn, noexec_addrs);
    }
}

bool Lifter::LiftInstruction(Instance& rinst, const cs_insn& insn, const std::vector<VAddr>& noexec_addrs) {
    return InstructionLifter(*this, rinst, insn, noexec_addrs).Run();
}
}
