@ECHO OFF
CALL "%~dp0cygdir.cmd"
CALL "%CYGDIR%\bin\dash.exe" "/bin/rebaseall"
IF %ERRORLEVEL% EQU 0 GOTO :eof
PAUSE
