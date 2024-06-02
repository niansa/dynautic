#ifndef ARCH_TRAITS_HPP
#define ARCH_TRAITS_HPP

namespace Dynautic {
namespace ArchTraits {
#ifdef __x86_64__
constexpr unsigned max_arg_count = 6;
#else
constexpr unsigned max_arg_count = 0;
#endif
}
}

#endif // ARCH_TRAITS_HPP
