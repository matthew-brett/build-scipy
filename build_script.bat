REM build and prepare for testing
REM Needs:
REM   SCIPY_COMMIT
REM   PYTHON_ARCH
REM   OPENBLAS_ROOT
git clone https://github.com/scipy/scipy.git
cd scipy
git checkout %SCIPY_COMMIT%
python ..\build_scipy.py . %PYTHON_ARCH% %OPENBLAS_ROOT%
cd dist
pip install --pre --no-index -f . scipy
pip install nose
REM Delete the original libraries to check import of vendored libs
rmdir /s /q %OPENBLAS_ROOT%\%PYTHON_ARCH%
