#ifndef TIMER_HPP
#define TIMER_HPP
#include <chrono>


namespace common {
class Timer {
    std::chrono::time_point<std::chrono::high_resolution_clock> value;

public:
    Timer() {
        reset();
    }

    void reset() {
        value = std::chrono::high_resolution_clock::now();
    }

    template<typename Unit = std::chrono::milliseconds>
    auto get() {
        auto duration = std::chrono::duration_cast<Unit>(std::chrono::high_resolution_clock::now() - value);
        return duration.count();
    }
};
}
#endif // TIMER_HPP
