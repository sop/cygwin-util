@ECHO OFF
REM check for elevated privileges
FSUTIL dirty query %SystemDrive% >nul
IF %ERRORLEVEL% NEQ 0 (
	ECHO ERROR: Please run this script as an administrator.
	PAUSE
	EXIT /B 1
)
REM resolve Cygwin installation directory
CALL "%~dp0cygdir.cmd"
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
REM description
REG ADD "HKCR\Cygwin.Script" /f /d "Cygwin Shell Script" > nul
REM FTA_NoRemove | FTA_NoNewVerb
REG ADD "HKCR\Cygwin.Script" /f /v "EditFlags" /t REG_DWORD ^
/d "0x00000030" > nul
REM default icon
REG ADD "HKCR\Cygwin.Script\DefaultIcon" /f ^
/d "%CYGDIR%\Cygwin-Terminal.ico,0" > nul
REM set open command to "cygexec.cmd"
REG ADD "HKCR\Cygwin.Script\shell" /f /d "open" > nul
REG ADD "HKCR\Cygwin.Script\shell\open\command" /f ^
/d "\"%~dp0cygexec.cmd\" \"%%1\" %%*" > nul
REM set drop handler
REG ADD "HKCR\Cygwin.Script\shellex\DropHandler" /f ^
/d "{86C86720-42A0-1069-A2E8-08002B30309D}" > nul
REM register .sh extension
REG ADD "HKCR\.sh" /f /d "Cygwin.Script" > nul
ECHO DONE: .sh filetype registered
PAUSE
