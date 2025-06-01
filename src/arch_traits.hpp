#ifndef ARCH_TRAITS_HPP
#define ARCH_TRAITS_HPP

namespace Dynautic {
namespace ArchTraits {
#if defined(__x86_64__)
constexpr unsigned max_arg_count = 14;
#elif defined(__aarch64__)
constexpr unsigned max_arg_count = 16;
#else
constexpr unsigned max_arg_count = 10;
#endif
} // namespace ArchTraits
} // namespace Dynautic

#endif // ARCH_TRAITS_HPP
