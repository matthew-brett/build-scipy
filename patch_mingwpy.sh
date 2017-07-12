#!/bin/bash
# patch mingwpy for msvcrt builds
MY_DIR=$(dirname "${BASH_SOURCE[0]}")
# Patch specs file
patch_file="${MY_DIR}/specs.patch"
specs_dir=$(dirname $(gcc --print-file specs))
(cd $specs_dir && patch < $patch_file)
gcc -dumpspecs
