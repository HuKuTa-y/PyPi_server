@echo off
echo ==========================================
echo ADMIN: Массовое скачивание пакетов
echo ==========================================
echo Chitaem spisok iz requirements.txt...

cd /d C:\Users\College\Desktop\PyPi_project\server\packages

for /f "usebackq tokens=*" %%a in ("C:\Users\College\Desktop\PyPi_project\requirements.txt") do (
    echo.
    echo Zagruzhaem: %%a
    pip download %%a -d . --no-cache-dir
)

echo.
echo ==========================================
echo SUCCESS! Vse pakety iz requirements.txt zagruzheny.
echo ==========================================
pause