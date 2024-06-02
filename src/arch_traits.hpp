#ifndef ARCH_TRAITS_HPP
#define ARCH_TRAITS_HPP

namespace Dynautic {
namespace ArchTraits {
#if defined(__x86_64__)
constexpr unsigned max_arg_count = 6;
#elif defined(__aarch64__)
constexpr unsigned max_arg_count = 0;
#else
constexpr unsigned max_arg_count = 0;
#endif
}
}

#endif // ARCH_TRAITS_HPP
