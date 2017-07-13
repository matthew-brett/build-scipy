#!/bin/bash
# patch mingwpy for msvcrt builds
patch_file="${PWD}/specs.patch"
specs_dir=$(dirname $(gcc --print-file specs))
(cd $specs_dir && echo $PWD && patch -p0 < $patch_file)
gcc -dumpspecs
