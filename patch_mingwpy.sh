#!/bin/bash
# patch mingwpy for msvcrt builds.
# copy .a files for use by MSVC.
patch_file="${PWD}/specs.patch"
specs_dir=$(dirname $(gcc --print-file specs))
(cd ${specs_dir} && \
    patch -p0 < $patch_file && \
    cp libgfortran.a gfortran.lib && \
    cp libquadmath.a quadmath.lib && \
    cp libgcc.a gcc.lib && \
    cp libmingwex.a mingw.lib)
gcc -dumpspecs
