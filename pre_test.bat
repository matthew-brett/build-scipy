REM Prepare for tests
REM Needs:
REM   PYTHON_ARCH
REM   OPENBLAS_ROOT
pip install --pre --no-index -f scipy\dist scipy
pip install nose
REM Delete the original libraries to check import of vendored libs
rmdir /s /q %OPENBLAS_ROOT%\%PYTHON_ARCH%
