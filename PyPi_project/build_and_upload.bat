@echo off
echo [0/6] Activating local environment and installing tools...
call C:\Users\College\Desktop\PyPi_project\test_client\venv\Scripts\activate.bat

:: ВАЖНО: pypiserver[passlib] в кавычках, чтобы установился с поддержкой паролей
python -m pip install --upgrade pip --quiet
python -m pip install pytest build twine "pypiserver[passlib]" bandit --quiet

echo [1/6] Bumping version...
python bump_version.py
if %errorlevel% neq 0 (
    echo [ERROR] Version bump failed!
    pause
    exit /b
)

echo [2/6] Security Scan (Bandit - Local Static Analysis)...
bandit -r C:\Users\College\Desktop\PyPi_project\my_package -ll
if %errorlevel% neq 0 (
    echo [ERROR] Security vulnerabilities found in code! Build aborted.
    pause
    exit /b
)

echo [3/6] Running tests (Quality Gate)...
cd /d C:\Users\College\Desktop\PyPi_project\my_package
python -m pytest test_math_utils.py
if %errorlevel% neq 0 (
    echo [ERROR] Tests failed! Build aborted.
    pause
    exit /b
)

echo [4/6] Starting PyPI server in background...
:: Абсолютные пути + passlib гарантируют успешный запуск
start /B "" "C:\Users\College\Desktop\PyPi_project\test_client\venv\Scripts\python.exe" -m pypiserver run -P "C:\Users\College\Desktop\PyPi_project\server\.htpasswd" -a update -p 8080 --overwrite "C:\Users\College\Desktop\PyPi_project\server\packages"
timeout /t 4 /nobreak >nul

echo [5/6] Cleaning old files...
if exist dist rmdir /s /q dist
if exist build rmdir /s /q build
if exist my_super_lib.egg-info rmdir /s /q my_super_lib.egg-info

echo [6/6] Building and uploading package...
python -m build
if %errorlevel% neq 0 (
    echo [ERROR] Build failed!
    pause
    exit /b
)

python -m twine upload --username admin --password mysecretpassword123 --repository-url http://localhost:8080 dist/*
if %errorlevel% neq 0 (
    echo [ERROR] Upload failed!
    pause
    exit /b
)

echo.
echo ==========================================
echo SUCCESS! Version bumped, security passed, tests passed, package uploaded.
echo ==========================================
pause