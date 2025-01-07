@echo off
cd /d "%~dp0"

:: Define the GitHub repository URL
set GITHUB_URL=https://codeberg.org/yesjdnke/manager.git

:: Uninstall existing library if any
echo Uninstalling existing version of my_main_manager...
python -m pip uninstall -y my_main_manager

:: Install the repository from GitHub
echo Installing repository from %GITHUB_URL%...
pip install git+%GITHUB_URL%
if %ERRORLEVEL% neq 0 (
    echo Failed to install repository from GitHub. Exiting.
    pause
    exit /b
)

:: Install dependencies from requirements.txt
echo Installing dependencies from requirements.txt...
python -m pip install -r requirements.txt
if %ERRORLEVEL% neq 0 (
    echo Failed to install dependencies. Exiting.
    pause
    exit /b
)

:: Run the application
echo Starting application...
python -m uvicorn main:app --reload
if %ERRORLEVEL% neq 0 (
    echo Failed to start the application. Exiting.
    pause
    exit /b
)

pause
