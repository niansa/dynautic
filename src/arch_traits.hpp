#ifndef ARCH_TRAITS_HPP
#define ARCH_TRAITS_HPP

namespace Dynautic {
namespace ArchTraits {

constexpr unsigned max_arg_count = 6;

static_assert(max_arg_count <= 16);
}
}

#endif // ARCH_TRAITS_HPP
