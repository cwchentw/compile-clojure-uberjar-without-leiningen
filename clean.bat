@echo off

set rootdir=%~dp0

rmdir /S /Q %rootdir%temp
del /S /Q %rootdir%hello.jar