#include "globalmonitor.hpp"

#include <vector>
#include <memory>
#include <csignal>
#include <unistd.h>
#include <sys/mman.h>
#include <dynautic/common.hpp>


namespace Dynautic {
static size_t page_size = static_cast<size_t>(sysconf(_SC_PAGESIZE));

std::vector<std::unique_ptr<GlobalMonitor>> GlobalMonitor::monitors;
std::mutex GlobalMonitor::monitors_mutex{};


namespace {
#ifdef ____GNUC__
#pragma GCC push_options
#pragma GCC optimize ("O0")
#endif

#ifdef __clang__
[[clang::optnone]]
#endif
int WasteTime() {
    static int value = 0;
    ++value;
    ++value;
    ++value;
    ++value;
    ++value;
    return value;
}

#ifdef ____GNUC__
#pragma GCC pop_options
#endif
}


Addr GlobalMonitor::GetPageAddr(Addr addr) {
    return (addr / page_size) * page_size;
}

void GlobalMonitor::ProtectPage(Addr addr) {
    int dummy;
    DYNAUTIC_ASSERT(GetPageAddr(reinterpret_cast<Addr>(&dummy)) != addr);
    bool mprotect_error = mprotect(reinterpret_cast<void*>(addr), page_size, PROT_READ|PROT_EXEC);
    DYNAUTIC_ASSERT(!mprotect_error);
}

void GlobalMonitor::UnprotectPage(Addr addr) {
    // rwx is evil but works for now
    bool mprotect_error = mprotect(reinterpret_cast<void*>(addr), page_size, PROT_READ|PROT_WRITE|PROT_EXEC);
    DYNAUTIC_ASSERT(!mprotect_error);
}

void GlobalMonitor::ProtectionFaultHandler(int, siginfo_t *info, void *) noexcept {
    DYNAUTIC_ASSERT(info->si_addr != 0);
    bool handled = false;
    // Make sure monitors mutex was able to be locked
    bool locked = monitors_mutex.try_lock();
    DYNAUTIC_ASSERT(locked);
    if (locked) {
        // Notify all monitors
        for (const auto& monitor : monitors) {
            // Skip non-existent monitors
            if (!monitor)
                continue;

            // Skip non-native monitors
            if (!monitor->native)
                continue;

            // Notify monitor
            if (monitor->Poison(reinterpret_cast<Addr>(info->si_addr)))
                handled = true;
        }
        monitors_mutex.unlock();
    }
    // Run actual segfault handler if no monitor could handle access
    if (!handled) {
        signal(SIGSEGV, SIG_DFL);
        raise(SIGSEGV);
    }
}

void GlobalMonitor::SetupNativeProtection() {
    // Only run once
    static bool done = false;
    if (done)
        return;

    // Setup signal handler
    struct sigaction act;
    memset (&act, '\0', sizeof(act));
    act.sa_sigaction = &ProtectionFaultHandler;
    act.sa_flags = SA_SIGINFO;
    bool sigaction_error = sigaction(SIGSEGV, &act, NULL) < 0;
    DYNAUTIC_ASSERT(!sigaction_error);

    // Mark as done
    done = true;
}

void GlobalMonitor::Create(uint8_t system_id, bool native) {
    std::scoped_lock L(monitors_mutex);

    if (native)
        SetupNativeProtection();

    if (monitors.size() <= system_id)
        monitors.resize(system_id+1);

    auto& monitor = monitors[system_id];
    if (!monitor)
        monitor = std::make_unique<GlobalMonitor>(native);
    else
        monitor->native = native;
}

GlobalMonitor &GlobalMonitor::Get(uint8_t system_id) {
    std::scoped_lock L(monitors_mutex);
    return *monitors[system_id];
}

void GlobalMonitor::Tag(Addr addr, size_t processor_id) {
    if (native)
        addr = GetPageAddr(addr);
    std::scoped_lock L(mutex);

    // Create new tag
    tags.emplace(addr, processor_id);

    // Apply memory protection if native memory
    if (native)
        ProtectPage(addr);
}

bool GlobalMonitor::Poison(Addr addr) {
    if (native)
        addr = GetPageAddr(addr);
    std::optional<std::scoped_lock<std::mutex>> L(mutex);

    // Find tag
    auto tag = tags.find(addr);
    if (tag == tags.end())
        return false;

    // Wait until untagged if native memory and different thread
    if (native && tag->second.thread_id != std::this_thread::get_id()) {
        // Unlock mutex
        L.reset();
        // Wait for conditional lock
        std::unique_lock<std::mutex> lock(tag->second.conditional_mutex);
        tag->second.conditional_lock.wait(lock);
        // Avoid race
        WasteTime();
        return true;
    }

    // Poison tag
    tag->second.poisoned = true;

    // Revert memory protection if native
    if (native)
        UnprotectPage(addr);

    return true;
}

bool GlobalMonitor::IsPoinsoned(Addr addr, size_t processor_id) {
    if (native)
        addr = GetPageAddr(addr);
    std::scoped_lock L(mutex);

    // Find tag
    auto tag = tags.find(addr);
    if (tag == tags.end())
        return true;

    // Check that tag is owned by given processor_id
    if (tag->second.processor_id != processor_id)
        return true;

    // Return poison value
    return tag->second.poisoned;
}

void GlobalMonitor::Untag(Addr addr, size_t processor_id) {
    if (native)
        addr = GetPageAddr(addr);
    std::scoped_lock L(mutex);

    // Find tag
    auto tag = tags.find(addr);
    if (tag == tags.end())
        return;

    // Stop if tag not owned by given processor_id
    if (tag->second.processor_id != processor_id)
        return;

    // Make sure we're still on the same thread
    DYNAUTIC_ASSERT(tag->second.thread_id == std::this_thread::get_id());

    // Erase tag
    tags.erase(tag);

    // Revert memory protection and notify waiters if native memory
    if (native) {
        UnprotectPage(addr);
        tag->second.conditional_lock.notify_all();
    }
}
} // namespace Dynautic
