@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo No folder specified.
    echo Please drag and drop a folder onto the bat file.
    pause
    exit /b
)

set "target_folder=%~1"

echo Processing folder: %target_folder%

for %%f in (%target_folder%\*.tga) do (
    ffmpeg -i "%%f" "%%~dpnf.png"
)

for %%f in (%target_folder%\*.bmp) do (
    ffmpeg -i "%%f" "%%~dpnf.png"
)

echo Conversion complete.
pause
