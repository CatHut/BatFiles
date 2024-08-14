@echo off
setlocal enabledelayedexpansion

REM Check if a file was dragged onto the batch file
if "%~1"=="" (
    echo Please drag and drop a video file onto this batch file.
    pause
    exit /b
)

REM Get the full path of the input file
set "input=%~f1"

REM Get the directory, filename, and extension of the input file
set "directory=%~dp1"
set "filename=%~n1"
set "extension=%~x1"

REM Set the output filename (original name + _noaudio + original extension)
set "output=!directory!!filename!_noaudio!extension!"

REM Check if ffmpeg is available in the system PATH
where ffmpeg >nul 2>&1
if %errorlevel% neq 0 (
    echo FFmpeg is not found in the system PATH.
    echo Please install FFmpeg and add it to your system PATH.
    pause
    exit /b
)

REM Remove audio from the video
echo Removing audio from: !input!
ffmpeg -i "!input!" -c copy -an "!output!"

REM Check if the operation was successful
if %errorlevel% equ 0 (
    echo Audio removed successfully.
    echo Output file: !output!
) else (
    echo An error occurred while removing the audio.
)

pause
