#include "cache.hpp"



namespace Dynautic::A64 {
void Cache::CreateDynamicBranchEntry(VAddr origin, VAddr target) {
    std::scoped_lock L(dynamic_branches_mutex);

    auto& entries = dynamic_branches[origin];
    for (auto& entry : entries) {
        if (entry.target == target) {
            ++entry.use_count;
            return;
        }
    }
    entries.push_back({target});
}

void Cache::Load(const std::vector<uint64_t>& data) {
    std::scoped_lock L(dynamic_branches_mutex);
    dynamic_branches.clear();
    for (auto it = data.begin(); it != data.end();) {
        const VAddr origin = *(it++);
        DYNAUTIC_ASSERT(it != data.end());
        std::vector<DynamicBranch> branches(*(it++));
        for (auto& entry : branches) {
            DYNAUTIC_ASSERT(it != data.end());
            entry.target = *(it++);
            DYNAUTIC_ASSERT(it != data.end());
            entry.use_count = *(it++);
        }
        dynamic_branches.emplace(origin, std::move(branches));
    }
}

std::vector<uint64_t> Cache::Dump() const {
    std::vector<uint64_t> fres;

    std::scoped_lock L(dynamic_branches_mutex);
    for (const auto& branch : dynamic_branches) {
        fres.push_back(branch.first);
        fres.push_back(branch.second.size());
        for (const auto& entry : branch.second) {
            fres.push_back(entry.target);
            fres.push_back(entry.use_count);
        }
    }

    return fres;
}
}
