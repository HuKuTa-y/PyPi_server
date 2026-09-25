@echo off
title My Private PyPI Server - Enterprise Edition
color 0A
echo.
echo ============================================================
echo   MY PRIVATE PYPI SERVER 
echo   Secure. Fast. Automated.
echo ============================================================
echo.
echo [1/3] Proverka virtualnogo okruzheniya...
call C:\Users\College\Desktop\PyPi_project\test_client\venv\Scripts\activate.bat

echo [2/3] Zapusk servera v fone...
start /B "" "C:\Users\College\Desktop\PyPi_project\test_client\venv\Scripts\python.exe" -m pypiserver run -P "C:\Users\College\Desktop\PyPi_project\server\.htpasswd" -a update -p 8080 --overwrite "C:\Users\College\Desktop\PyPi_project\server\packages"
timeout /t 3 /nobreak >nul

echo [3/3] Otkrytie paneli upravleniya v brauzere...
start http://localhost:8080

echo.
echo ============================================================
echo  SERVER USPESHNO ZAPUSHEN! 
echo  Panel upravleniya otkryta v brauzere.
echo  Dlya ostanovki zakroyte eto okno.
echo ============================================================
echo.
pause