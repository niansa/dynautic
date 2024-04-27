#ifndef CACHE_HPP
#define CACHE_HPP
#include <unordered_map>
#include <vector>
#include <mutex>
#include <dynautic/A64.hpp>


namespace Dynautic::A64 {
struct Cache {
    struct DynamicBranch {
        VAddr target;
        uint64_t use_count = 0;
    };

    mutable std::mutex dynamic_branches_mutex;
    std::unordered_map<VAddr, std::vector<DynamicBranch>> dynamic_branches;

    void CreateDynamicBranchEntry(VAddr origin, VAddr target);

    void Reset() {
        std::scoped_lock L(dynamic_branches_mutex);
        dynamic_branches.clear();
    }
    void Load(const std::vector<uint64_t>&);
    std::vector<uint64_t> Dump() const;
};
}
#endif // CACHE_HPP
