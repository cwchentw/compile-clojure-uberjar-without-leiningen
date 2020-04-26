@echo off

rem Check whether Java is available.
java -version 1>nul 2>&1 || (
    echo No Java on the system >&2
    exit /B 1
)

md temp

java -cp "clojure.jar;src" clojure.main ^
  --eval "(set! *compile-path* \"temp\")" ^
  --eval "(compile 'hello)"

set cwd=%CD%
set rootdir=%~dp0

cd %rootdir%temp || (
    echo temp directory is not available >&2
    exit /B 1
)

jar xf ../clojure.jar

echo Main-Class: hello > manifest.mf

jar cfm ../hello.jar manifest.mf * clojure

cd %cwd%