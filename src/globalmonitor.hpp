#ifndef DYNAUTIC_A64_GLOBALMONITOR_HPP
#define DYNAUTIC_A64_GLOBALMONITOR_HPP
#include <csignal>
#include <cstdint>
#include <memory>
#include <mutex>
#include <thread>
#include <unordered_map>

namespace Dynautic {
using Addr = uint64_t;

class GlobalMonitor {
    static std::vector<std::unique_ptr<GlobalMonitor>> monitors;
    static std::mutex monitors_mutex;

    static Addr GetPageAddr(Addr addr);
    static void ProtectPage(Addr addr);
    static void UnprotectPage(Addr addr);
    static void ProtectionFaultHandler(int sig, siginfo_t *info, void *ctx) noexcept;
    static void SetupNativeProtection();

    struct Tag {
        size_t processor_id;
        bool poisoned = false;
        std::thread::id thread_id;

        std::mutex conditional_mutex{};
        std::condition_variable conditional_lock{};

        Tag(size_t processor_id) : processor_id(processor_id), thread_id(std::this_thread::get_id()) {}
    };

    std::unordered_map<Addr, Tag> tags;
    std::mutex mutex;

    bool native;

public:
    GlobalMonitor(bool native) : native(native) {}

    static void Create(uint8_t system_id, bool native);
    static GlobalMonitor& Get(uint8_t system_id);

    void Tag(Addr addr, size_t processor_id);
    bool Poison(Addr addr);
    bool IsPoisoned(Addr addr, size_t processor_id);
    void Untag(Addr addr, size_t processor_id);
};
} // namespace Dynautic
#endif // DYNAUTIC_A64_GLOBALMONITOR_HPP
