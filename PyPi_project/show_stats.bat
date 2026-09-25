@echo off
echo ==========================================
echo SERVER STATISTICS
echo ==========================================
echo.
echo Packages on server:
dir /b C:\Users\College\Desktop\PyPi_project\server\packages\*.whl 2>nul | find /c /v ""
echo.
echo Total size of packages:
powershell -command "(Get-ChildItem C:\Users\College\Desktop\PyPi_project\server\packages -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB" | findstr /r "[0-9]"
echo MB
echo.
echo Build history:
if exist build_log.txt (
    find /c /v "" build_log.txt
    echo entries in log
) else (
    echo No builds yet
)
echo.
pause