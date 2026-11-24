@echo off
rem Starts Daily Brew on http://localhost:8080 and opens it in your browser.
cd /d "%~dp0"
where py >nul 2>nul && (start "" http://localhost:8080 & py -m http.server 8080 & goto :eof)
where python >nul 2>nul && (start "" http://localhost:8080 & python -m http.server 8080 & goto :eof)
where npx >nul 2>nul && (start "" http://localhost:8080 & npx --yes serve -l 8080 . & goto :eof)
echo Couldn't find Python or Node.js, so opening the file directly instead.
echo Everything works except offline mode. See README.md for other options.
start "" "%~dp0index.html"
pause
