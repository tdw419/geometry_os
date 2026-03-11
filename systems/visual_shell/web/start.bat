@echo off
REM Geometry OS Web Edition - Quick Start Script for Windows
REM This script starts the mock server and opens the application in your browser

setlocal enabledelayedexpansion

REM Configuration
set HTTP_PORT=%1
if "%HTTP_PORT%"=="" set HTTP_PORT=8000

set WS_PORT=%2
if "%WS_PORT%"=="" set WS_PORT=8765

echo ========================================
echo    Geometry OS: Web Edition
echo ========================================
echo.

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    pause
    exit /b 1
)

echo Checking Python version...
python --version
echo.

REM Check dependencies
echo Checking dependencies...
set MISSING_DEPS=

python -c "from PIL import Image" >nul 2>&1
if errorlevel 1 set MISSING_DEPS=pillow

python -c "import websockets" >nul 2>&1
if errorlevel 1 set MISSING_DEPS=%MISSING_DEPS% websockets

python -c "import aiohttp" >nul 2>&1
if errorlevel 1 set MISSING_DEPS=%MISSING_DEPS% aiohttp

if not "%MISSING_DEPS%"=="" (
    echo Missing dependencies: %MISSING_DEPS%
    echo.
    echo Installing missing dependencies...
    pip install %MISSING_DEPS%
    if errorlevel 1 (
        echo Error: Failed to install dependencies
        pause
        exit /b 1
    )
    echo Dependencies installed successfully
) else (
    echo All dependencies installed
)

echo.
echo Starting Geometry OS Mock Server...
echo   HTTP API:  http://127.0.0.1:%HTTP_PORT%
echo   WebSocket: ws://127.0.0.1:%WS_PORT%
echo.

REM Start mock server in background
start /B python mock_server.py %HTTP_PORT% %WS_PORT%

REM Wait for server to start
echo Waiting for server to start...
timeout /t 2 /nobreak >nul

echo Server started successfully
echo.

REM Open browser
echo Opening browser...
set BROWSER_URL=http://127.0.0.1:%HTTP_PORT%/index.html

REM Try to open browser
start "" "%BROWSER_URL%"

echo Browser opened: %BROWSER_URL%
echo.

echo ========================================
echo    Geometry OS is Running
echo ========================================
echo.
echo   Application: %BROWSER_URL%
echo   HTTP API:     http://127.0.0.1:%HTTP_PORT%
echo   WebSocket:    ws://127.0.0.1:%WS_PORT%
echo.
echo Controls:
echo   - Mouse drag: Pan map
echo   - Scroll wheel: Zoom in/out
echo   - Arrow keys: Pan map
echo   - +/- keys: Zoom in/out
echo.
echo To stop the server, close this window
echo.

REM Keep window open
pause
