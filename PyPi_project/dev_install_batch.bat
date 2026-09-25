@echo off
echo ==========================================
echo DEV: Массовая установка из локальной папки
echo (Internet otkluchen dlya etoy operatsii)
echo ==========================================
echo Chitaem spisok iz requirements.txt...

call C:\Users\College\Desktop\PyPi_project\test_client\venv\Scripts\activate.bat

for /f "usebackq tokens=*" %%a in ("C:\Users\College\Desktop\PyPi_project\requirements.txt") do (
    echo.
    echo Ustanavlivaem: %%a
    pip uninstall %%a -y >nul 2>&1
    pip install --no-index --find-links=C:\Users\College\Desktop\PyPi_project\server\packages %%a
)

echo.
echo ==========================================
echo SUCCESS! Vse pakety ustanovleny iz lokalnoy papki.
echo ==========================================
pause