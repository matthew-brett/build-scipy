#!/bin/bash
# patch numpy distutils
patch_file="${PWD}/numpy.patch"
np_dir=$(python -c 'import os; import numpy; print(os.path.dirname(numpy.__file__))')
(cd $np_dir && echo $PWD && patch -p0 < $patch_file)
