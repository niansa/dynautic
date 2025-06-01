#! /bin/sh

find . -iname *.h -o -iname *.hpp -o -iname *.cpp | grep -v externals/ | grep -v build/ | grep -v dynarmic/ | xargs clang-format-19 --style=file:clang-format --verbose -i
