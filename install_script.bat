REM Prepare scipy build
REM Needs:
REM   PYTHON
REM   OPENBLAS_WHEEL_URL
REM   MSYS2_ROOT
REM Get Python bitness
REM https://stackoverflow.com/questions/1746475/windows-batch-help-in-setting-a-variable-from-command-output#4509885
set PY_CMD=%PYTHON%\Python.exe -c "import platform; print(platform.architecture()[0][:2])"
for /f "tokens=1 delims=" %%i in ('%PY_CMD%') do set PYTHON_ARCH=%%i
REM Install mingwpy into matching bitness Python 2.7, patch, put on PATH
call install_mingwpy.bat
REM Put the building Python on the path
SET PATH=%PYTHON%;%PYTHON%\Scripts;%PATH%
REM Download built openblas libraries
cmd /c unpack_openblas.bat
REM Update pip, virtualenv
%PYTHON%\Python.exe -m pip install --upgrade pip
%PYTHON%\Python.exe -m pip install --upgrade virtualenv
REM Build in virtualenv
if exist venv (rmdir /s /q venv)
%PYTHON%\Scripts\virtualenv venv
call venv\Scripts\activate.bat
REM OpenBLAS numpy wheels
pip install --no-index -f %OPENBLAS_WHEEL_URL% numpy
REM Patch numpy distutils
%MSYS2_ROOT%\usr\bin\pacman -Sy --noconfirm patch
%MSYS2_ROOT%\usr\bin\bash patch_numpy.sh
REM Other build dependencies
pip install delocate cython
