REM build scipy
REM Needs:
REM   SCIPY_COMMIT
git clone https://github.com/scipy/scipy.git
cd scipy
git checkout %SCIPY_COMMIT%
git clean -fxd
python ..\build_scipy.py . %PYTHON_ARCH% %OPENBLAS_ROOT%
cd ..
