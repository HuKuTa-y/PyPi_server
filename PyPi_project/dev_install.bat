@echo off
title Установка пакетов (Offline Mode)
color 0B
echo.
echo ============================================================
echo   DEV INSTALLER [SECURE OFFLINE MODE]
echo ============================================================
echo.
set /p pkg="Vvedite imya paketa: "

echo [*] Aktivatsiya izolirovannogo okruzheniya...
call C:\Users\College\Desktop\PyPi_project\test_client\venv\Scripts\activate.bat >nul 2>&1

echo [*] Proverka nalichiya '%pkg%' v lokalnom kheshe...
pip install --no-index --find-links=C:\Users\College\Desktop\PyPi_project\server\packages %pkg%

if %errorlevel% equ 0 (
    echo.
    color 0A
    echo ============================================================
    echo   [SUCCESS] Paket '%pkg%' uspeshno ustanovlen!
    echo   Internet access: BLOCKED
    echo ============================================================
) else (
    echo.
    color 0C
    echo ============================================================
    echo   [ERROR] Paket '%pkg%' ne nayden v lokalnom kheshe!
    echo   Obratites k administratoru dlya dobavleniya paketa.
    echo ============================================================
)
echo.
pause