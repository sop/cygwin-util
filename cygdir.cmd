@ECHO OFF
SETLOCAL
REM filename to test when searching for Cygwin directory
SET _detectFile=bin\cygwin1.dll
REM if CYGDIR env is already set
IF DEFINED CYGDIR (
	IF EXIST "%CYGDIR%\%_detectFile%" (
		GOTO:eof
	)
)
REM remove quotes
SET _cygdir=%~0
REM absolutize path
FOR %%F IN ("%_cygdir%") DO SET _cygdir=%%~fF
REM set initial directory to script's directory
CALL :dirname "%_cygdir%" _cygdir
:while_searchpath
REM check if root was reached
FOR %%F IN ("%_cygdir%") DO SET _drive=%%~dF
IF "%_cygdir%"=="%_drive%" (
	ECHO Cygwin installation directory not found.
	EXIT /B 1
)
REM if path contains "bin\cygcheck.exe" file
IF EXIST "%_cygdir%\%_detectFile%" (
	GOTO :endwhile_searchpath
)
REM retry with parent directory
CALL :dirname "%_cygdir%" _cygdir
GOTO :while_searchpath
:endwhile_searchpath
REM store found directory to %CYGDIR% variable
ENDLOCAL & SET CYGDIR=%_cygdir%
GOTO:eof

:dirname
SETLOCAL
SET _ret=%~dp1
SET _ret=%_ret:~0,-1%
ENDLOCAL & SET %2=%_ret%
GOTO:eof
