@echo off

rem Check whether Java is available.
java -version 1>nul 2>&1 || (
    echo No Java on the system >&2
    exit /B 1
)

set cwd=%CD%
set rootdir=%~dp0

md %rootdir%temp

powershell -Command "Get-Command -Name Invoke-Clojure -ErrorAction SilentlyContinue" 1>nul 2>&1
if "%ERRORLEVEL%" == "0" (
    echo Compile hello.clj with Clojure cli tool
    powershell -Command Invoke-Clojure compile.clj
) else (
    echo Compile hello.clj with plain Clojure
    java -cp "clojure.jar;src" clojure.main compile.clj
)

cd %rootdir%temp || (
    echo temp directory is not available >&2
    exit /B 1
)

jar xf ../clojure.jar

echo Main-Class: hello > manifest.mf

jar cfm ../hello.jar manifest.mf * clojure

cd %cwd%
