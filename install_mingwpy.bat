REM Install mingwpy into matching bitness Python 2.7, patch, put on PATH
REM Expects (default)
REM    PYTHON_ARCH: 64 or 32
REM    PYMW_64: c:\Python27-64
REM    PYMW_32: c:\Python27
REM install and patch mingwpy
if [%PYTHON_ARCH%]==[64] (
    set MINGW_PYTHON=%PYMW_64%
) else (
    set MINGW_PYTHON=%PYMW_32%
)
set PATH=%MINGW_PYTHON%\Scripts;%PATH%
%MINGW_PYTHON%\Scripts\pip.exe install -i https://pypi.anaconda.org/carlkl/simple mingwpy
bash patch_mingwpy.sh
