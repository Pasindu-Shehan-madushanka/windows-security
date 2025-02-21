@echo off
echo "[+] Removing Program Hider :>"
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)


set "scriptDir=%~dp0"
set "fileName=WindowsSecurityRun.exe"
set "filePath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\%fileName%"

if exist "%filePath%" (
    del "%filePath%"
    if %errorLevel% equ 0 (
        echo File deleted successfully.
    ) else (
        echo Failed to delete the file.
        pause
    )
) else (
    echo File not found in the Startup folder.
    pause
)
