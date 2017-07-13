#!/bin/bash
# patch mingwpy for msvcrt builds
patch_file="${PWD}/specs.patch"
echo Zero $(which gcc)
echo Zero.One ${PWD} $(gcc --version)
echo Zero.Two $(ls)
echo One $(gcc --print-file specs)
echo Two $(dirname $(gcc --print-file specs))
specs_dir=$(dirname $(gcc --print-file specs))
echo Here $specs_dir
(cd ${specs_dir} && echo $PWD && patch -p0 < $patch_file)
gcc -dumpspecs
