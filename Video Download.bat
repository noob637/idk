@echo off
setlocal enabledelayedexpansion

set "folder=%userprofile%\Desktop\video download tool"
set "yt=yt-dlp.exe"
if not exist "%folder%" mkdir "%folder%"

if not exist "%folder%\%yt%" (
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe' -OutFile '%folder%\%yt%'"
)

cls
echo Type Requirements, The Video Automatically Goes To The Desktop
set /p "user_input=Enter Video URL: "
set /p "name=Enter Video Name: "
set "user_input=!user_input:"=!"
set "name=!name:"=!"

"%folder%\%yt%" -o "%userprofile%\Desktop\!name!.%%(ext)s" "!user_input!"

pause
