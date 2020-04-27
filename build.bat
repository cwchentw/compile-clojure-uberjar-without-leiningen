@echo off

rem Check whether Java is available.
java -version 1>nul 2>&1 || (
    echo No Java on the system >&2
    exit /B 1
)

set cwd=%CD%
set rootdir=%~dp0

md %rootdir%temp || (
    echo Failed to make directory %rootdir%temp >&2
    exit /B 1
)

powershell -Command "Get-Command -Name Invoke-Clojure -ErrorAction SilentlyContinue" 1>nul 2>&1
if "%ERRORLEVEL%" == "0" (
    echo Compile hello.clj with Clojure cli tool
    powershell -Command Invoke-Clojure compile.clj
) else (
    echo Compile hello.clj with plain Clojure
    java -cp "clojure.jar;src" clojure.main compile.clj
)

cd %rootdir%temp || (
    echo %rootdir%temp directory is not available >&2
    exit /B 1
)

jar xf ../clojure.jar || (
    echo Failed to extract clojure.jar >&2
    exit /B 1
)

echo Main-Class: hello > manifest.mf || (
    echo Failed to write manifest.mf >&2
    exit /B 1
)

jar cfm ../hello.jar manifest.mf * clojure || (
    echo Failed to make hello.jar >&2
    exit /B 1
)

cd %cwd% || (
    echo Failed to go to %cwd% >&2
    exit /B 1
)
