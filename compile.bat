@echo off

powershell -Command "Get-Command -Name Invoke-Clojure -errorAction SilentlyContinue" 1>nul 2>&1
if "%ERRORLEVEL%" == "1" (
    echo No Clojure cli tool on the system >&2
    exit /B 1
)

set rootdir=%~dp0

md %rootdir%temp

powershell -Command Invoke-Clojure %rootdir%compile.clj
