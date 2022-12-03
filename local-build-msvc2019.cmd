REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOAD_DIR=%USERPROFILE%\Downloads
set DOWNLOAD_DIR_LINUX=%DOWNLOAD_DIR:\=/%

@REM %DOWNLOAD_DIR%\mingw64-win32; ^
@REM %DOWNLOAD_DIR%\mingw64-win32\bin; ^

SET PATH=^
%DOWNLOAD_DIR%\PortableGit\bin;^
%DOWNLOAD_DIR%\cmake-3.22.2-windows-x86_64\bin;


@REM https://download.pytorch.org/libtorch/cpu/libtorch-win-shared-with-deps-1.13.0%2Bcpu.zip

@REM -Dtensorflow_ROOT="%DOWNLOAD_DIR_LINUX%/libtensorflow-gpu-windows-x86_64-2.6.0" ^
@REM gpu needs CUDA dlls
cmake -G "Visual Studio 16 2019" -A x64 ^
-DCMAKE_PREFIX_PATH="%DOWNLOAD_DIR_LINUX%/libtorch-win-shared-with-deps-1.13.0+cpu/libtorch" ^
-B./cmake-build &&^
cd cmake-build
cmake --build . --target ALL_BUILD --config Release -- /nologo /verbosity:minimal /maxcpucount
pause

