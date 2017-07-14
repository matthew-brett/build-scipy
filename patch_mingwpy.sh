#!/bin/bash
# patch mingwpy for msvcrt builds.
# copy .a files for use by MSVC.
my_dir=$PWD
gcc -c iob_hack.c
specs_dir=$(dirname $(gcc --print-file specs))
(cd ${specs_dir} && \
    patch -p0 < "${my_dir}/specs.patch" && \
    cp $my_dir/iob_hack.o iob_hack.lib && \
    cp  ../../../../*-mingw32/lib/libmingw*.a . && \
    cp libmingw32.a mingw32.lib  && \
    cp libmingwex.a mingwex.lib  && \
    cp libgcc.a gcc.lib  && \
    cp libgfortran.a gfortran.lib && \
    cp libquadmath.a quadmath.lib)
gcc -dumpspecs
