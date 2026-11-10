@echo off
title FitAtHome
cd /d "%~dp0"
where node >/dev/null 2>nul
if errorlevel 1 (
  echo Node.js is not installed. Download the LTS version from https://nodejs.org and run this file again.
  pause
  exit /b
)
if not exist node_modules (
  echo Installing dependencies - first run only, please wait...
  call npm install
)
echo Starting FitAtHome at http://localhost:5173 ...
call npm run dev
pause
