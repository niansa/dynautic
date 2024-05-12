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

std::optional<ExecutorAddr> Lifter::Lift(VAddr addr) {
    DYNAUTIC_ASSERT(IsOk() && rt.jit);

    // Skip if already compiled
    if (auto expected_address = rt.jit->lookup(GetFunctionName(addr)))
        return expected_address.get();

    // Enqueue address
    queued_functions.emplace(addr);

    // Set up context and module
    std::unique_ptr<LLVMContext> context = std::make_unique<LLVMContext>();
    std::unique_ptr<Module> module = std::make_unique<Module>("ModuleAt"+std::to_string(addr), *context);

    // List of processed but not yet compiled functions
    std::vector<VAddr> processed_fncs;

    // Go through all functions
    while (!queued_functions.empty()) {
        const VAddr addr = queued_functions.front();

        // Skip already processed functions
        if (std::find(processed_fncs.begin(), processed_fncs.end(), addr) != processed_fncs.end()) {
            queued_functions.pop();
            continue;
        }

        // Get function name
        const std::string function_name = GetFunctionName(addr);

        // Create entry block and branch
        Instance rinst(rt, context.get(), module.get(), function_name);
        rinst.UseBasicBlock(rinst.CreateBasicBlock("EntryBlock"));
        rinst.builder->CreateBr(rinst.QueueBranch(addr, "BranchAtEntryBlock"));

        // Lift each leaf until none are left
        while (rinst.NextBranch()) {
            if (!rinst.IsDynamicBranch()) {
                // Lift leaf with known address
                rinst.pc = rinst.GetBranchAddr();
                CreateDebugPrintTrampoline(rinst, "Branch completed");
                LiftLeaf(rinst, rinst.pc);
            } else {
                CreateDebugPrintTrampoline(rinst, "Dynamic branch happening...");
                CreateLiftTrampolineBlock(rinst, rinst.GetBranchOrigin());
            }
        }

        // Add function to list of processed functions
        processed_fncs.push_back(addr);

        // Remove function from queue
        queued_functions.pop();
    }

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

    // Look up added function and return address
    return rt.jit->lookup(GetFunctionName(addr)).get();
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
    VAddr last_addr = addr;
    std::vector<VAddr> noexec_addrs;

    LoadContext(rinst);

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
        uint8_t udf[4] = {0xff, 0xff, 0xff, 0xff};
        cs_insn *insns;
        cs_disasm(cs_handle, udf, sizeof(udf), addr, 0, &insns);
        LiftInstruction(rinst, *insns, noexec_addrs);
        cs_free(insns, 1);
    }
}

bool Lifter::LiftInstruction(Instance& rinst, const cs_insn& insn, const std::vector<VAddr>& noexec_addrs) {
    return InstructionLifter(*this, rinst, insn, noexec_addrs).Run();
}
}
