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


Addr GlobalMonitor::GetPageAddr(Addr addr) {
    return (addr / page_size) * page_size;
}

void GlobalMonitor::ProtectPage(Addr addr) {
    bool mprotect_error = mprotect(reinterpret_cast<void*>(addr), page_size, PROT_READ|PROT_EXEC);
    DYNAUTIC_ASSERT(!mprotect_error);
}

void GlobalMonitor::UnprotectPage(Addr addr) {
    // rwx is evil but works for now
    bool mprotect_error = mprotect(reinterpret_cast<void*>(addr), page_size, PROT_READ|PROT_WRITE|PROT_EXEC);
    DYNAUTIC_ASSERT(!mprotect_error);
}

void GlobalMonitor::ProtectionFaultHandler(int, siginfo_t *info, void *) noexcept {
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

    auto& mon = monitors[system_id];
    if (!mon)
        mon = std::make_unique<GlobalMonitor>(native);
}

GlobalMonitor &GlobalMonitor::Get(uint8_t system_id) {
    std::scoped_lock L(monitors_mutex);
    return *monitors[system_id];
}

void GlobalMonitor::Tag(Addr addr, size_t processor_id) {
    addr = GetPageAddr(addr);
    std::scoped_lock L(mutex);

    // Check for existing tag
    auto existing_tag = tags.find(addr);
    if (existing_tag != tags.end()) {
        // Update tag to current processor ID and reset poison
        existing_tag->second.processor_id = processor_id;
        existing_tag->second.poisoned = false;
        return;
    }

    // Create new tag
    tags.emplace(addr, processor_id);

    // Apply memory protection if native memory
    if (native)
        ProtectPage(addr);
}

bool GlobalMonitor::Poison(Addr addr) {
    addr = GetPageAddr(addr);
    std::scoped_lock L(mutex);

    // Find tag
    auto tag = tags.find(addr);
    if (tag == tags.end())
        return false;

    // Wait until untagged if native memory
    if (native) {
        std::unique_lock<std::mutex> lock(tag->second.conditional_mutex);
        tag->second.conditional_lock.wait(lock);
        return true;
    }

    // Poison tag
    tag->second.poisoned = true;
    return true;
}

bool GlobalMonitor::IsPoinsoned(Addr addr, size_t processor_id) {
    addr = GetPageAddr(addr);

    // Will never be poisoned with native memory
    if (native)
        return false;

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
    addr = GetPageAddr(addr);
    std::scoped_lock L(mutex);

    // Find tag
    auto tag = tags.find(addr);
    if (tag == tags.end())
        return;

    // Stop if tag not owned by given processor_id
    if (tag->second.processor_id != processor_id)
        return;

    // Notify waiters if native memory
    if (native)
        tag->second.conditional_lock.notify_all();

    // Erase tag
    tags.erase(tag);

    // Revert memory protection if native memory
    if (native)
        UnprotectPage(addr);
}
} // namespace Dynautic
