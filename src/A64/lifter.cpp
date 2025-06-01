#include "lifter.hpp"
#include "../llvm.hpp"
#include "lifter_instance.hpp"
#include "lifter_instructions.hpp"
#include "runtime.hpp"

#include <array>
#include <capstone/capstone.h>
#include <dynautic/A64.hpp>
#include <memory>
#include <optional>
#include <string>
#include <vector>

using namespace llvm;
using namespace llvm::orc;

namespace Dynautic::A64 {
Lifter::Lifter(Runtime::Impl& runtime) : rt(runtime) {
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

std::string Lifter::GetFunctionName(VAddr addr) { return "FncAt" + std::to_string(addr); }

FunctionCallee Lifter::GetLiftedFunction(Instance& rinst, VAddr addr) { return rinst.CreateFunction(GetFunctionName(addr), llvm::Function::ExternalLinkage); }

std::optional<ExecutorAddr> Lifter::Lift(VAddr addr) {
    // Skip if entry already compiled
    for (const auto& [that_addr, entry] : entries)
        if (that_addr == addr)
            return entry;

    // Go on generating new code if everything looks alright
    DYNAUTIC_ASSERT(IsOk() && rt.jit);

    // Enqueue address
    queued_functions.emplace(addr);

    // Set up context and module
    std::unique_ptr<LLVMContext> context = std::make_unique<LLVMContext>();
    std::unique_ptr<Module> module = std::make_unique<Module>("ModuleAt" + std::to_string(addr), *context);

    // List of processed but not yet compiled functions
    std::vector<VAddr> processed_fncs;

    // Go through all functions
    while (!queued_functions.empty()) {
        const VAddr addr = queued_functions.front();

        // Remove function from queue
        queued_functions.pop();

        // Skip already processed functions
        if (std::find(processed_fncs.begin(), processed_fncs.end(), addr) != processed_fncs.end())
            continue;

        // Skip if already compiled
        if (std::find(compiled_functions.begin(), compiled_functions.end(), addr) != compiled_functions.end())
            continue;

        // Create entry block and branch
        Instance rinst(rt, context.get(), module.get(), GetFunctionName(addr));
        rinst.UseBasicBlock(rinst.CreateBasicBlock("EntryBlock"));
        UndirtyFunctionContext();
        LoadFunctionContext(rinst, true);
        rinst.builder->CreateBr(rinst.QueueBranch(addr, "BranchAtEntryBlock"));

        // Lift each leaf until none are left
        while (rinst.NextBranch()) {
            if (!rinst.IsDynamicBranch()) {
                // Lift leaf with known address
                rinst.pc = rinst.GetBranchAddr();
                CreateDebugPrintTrampoline(rinst, "Branch completed");
                LiftLeaf(rinst, rinst.pc);
                // Ensure branch context has been synced up properly
                if (rt_values.dirty)
                    outs() << *module;
                DYNAUTIC_ASSERT(!rt_values.dirty);
            } else {
                CreateDebugPrintTrampoline(rinst, "Dynamic branch happening...");
                CreateLiftTrampolineBlock(rinst, rinst.GetBranchOrigin());
            }
        }

        // Add function to list of processed functions
        processed_fncs.push_back(addr);

        // Ensure function context has been synced up properly
        DYNAUTIC_ASSERT(!rt_allocas.dirty);
    }

    // Get entry function name
    const auto entry_fnc_name = GetFunctionName(addr) + "Entry";

    // Create entry function
    Instance rinst(rt, context.get(), module.get(), entry_fnc_name, true);
    rinst.pc = addr;
    rinst.UseBasicBlock(rinst.CreateBasicBlock("EntryBlock"));
    if (rt.conf.periodic_recompile)
        CreateResetJITForPeriodicRecompileTrampolineTrampoline(rinst);
    UndirtyFunctionContext();
    LoadFunctionContext(rinst, true, true);
    CreateCall(rinst, static_cast<VAddr>(-1), addr);

#ifdef ENABLE_LLVM_VALIDATION
    // Run verifier
    VerifierAnalysis verifier;
    ModuleAnalysisManager analysisManager;
    auto verifierResult = verifier.run(*module, analysisManager);
    if (verifierResult.IRBroken)
        errs() << "Module is broken!\n";
    else

#endif
        // Optimize module
        if (rt.conf.HasOptimization(OptimizationFlag::LLVMIROpt))
            OptimizeModule(*module);

    // Dump generated IR if enabled
    if (rt.conf.dump_assembly)
        outs() << *module;

    // Add module to JIT
    auto error = rt.jit->addIRModule(ThreadSafeModule(std::move(module), std::move(context)));
    if (error) {
        errs() << "Failed to add module: " << error << '\n';
        return {};
    }

    // Insert list of processed functions into list of compiled functions
    compiled_functions.insert(compiled_functions.end(), processed_fncs.begin(), processed_fncs.end());

    // Look up added function, add it to list
    const auto fres = rt.jit->lookup(entry_fnc_name).get();
    entries.emplace(addr, fres);

    // Reset last compile timer
    rt.lastCompile.reset();

    // Return address of generated function
    return fres;
}

void Lifter::DeferLift(VAddr addr) {
    // Get module name
    const std::string function_name = GetFunctionName(addr);

    // Skip if already compiled
    if (rt.jit->lookup(function_name))
        return;

    queued_functions.emplace(addr);
}

void Lifter::LiftLeaf(Instance& rinst, VAddr addr) {
    std::vector<VAddr> noexec_addrs;

    LoadBranchContext(rinst);

    // Lift instructions in blocks
    std::array<uint8_t, 0x100> block;
    static_assert((block.size() % 4) == 0);
    bool first_instruction = true;
    for (bool stop = false; !stop; addr += block.size()) {
        // Read block
        for (unsigned off = 0; off != block.size(); off += 4) {
            uint32_t& instr = *reinterpret_cast<uint32_t *>(&block[off]);
            const auto opt = rt.conf.callbacks->MemoryReadCode(addr + off);
            if (opt.has_value()) {
                instr = opt.value();
            } else {
                noexec_addrs.push_back(addr + off);
                instr = 0xffffffff;
            }
        }

        // Disassemble instructions
        cs_insn *insns;
        const auto count = cs_disasm(cs_handle, block.data(), block.size(), addr, 0, &insns);

        // Lift all instructions
        for (unsigned i = 0; i != count; ++i) {
            if (!LiftInstruction(rinst, insns[i], first_instruction, noexec_addrs) || rinst.block_terminated) {
                stop = true;
                break;
            }
            first_instruction = false;
        }

        // Clean up disassembly
        cs_free(insns, count);

        // Stop if instruction count is not max
        if (count != block.size() / 4)
            break;
    }

    // Lift undefined instruction if block hasn't been terminated
    if (!rinst.block_terminated) {
        uint8_t udf[4] = {0xff, 0xff, 0xff, 0xff};
        cs_insn *insns;
        cs_disasm(cs_handle, udf, sizeof(udf), addr, 0, &insns);
        LiftInstruction(rinst, *insns, false);
        cs_free(insns, 1);
    }
}

bool Lifter::LiftInstruction(Instance& rinst, const cs_insn& insn, bool first_instruction, const std::vector<VAddr>& noexec_addrs) {
    return InstructionLifter(*this, rinst, insn, noexec_addrs).Run(first_instruction);
}
} // namespace Dynautic::A64
