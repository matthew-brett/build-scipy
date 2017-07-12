REM Install mingwpy into matching bitness Python 2.7, patch, put on PATH
REM Expects (default)
REM    PYTHON_ARCH: 64 or 32
REM    MSYS2_ROOT: c:\msys64
REM put msys2 at end of PATH, but strip out gcc, gfortran
IF [%MSYS2_ROOT%] EQU [] set MSYS2_ROOT=c:\msys64
set PATH=%PATH%;%MSYS2_ROOT%
pacman -Sy --noconfirm git zip
pacman -Rs --noconfirm gcc gcc-fortran
REM install and patch mingwpy
set MINGW_PYTHON=C:\Python27
IF [%PYTHON_ARCH%] EQU [64] set MINGW_PYTHON=%MINGW_PYTHON%-x64
set PATH=%MINGW_PYTHON%\Scripts;%PATH%
%MINGW_PYTHON%\Scripts\pip.exe install -i https://pypi.anaconda.org/carlkl/simple mingwpy
bash patch_mingwpy.sh
