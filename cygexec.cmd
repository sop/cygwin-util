@ECHO OFF
SETLOCAL EnableDelayedExpansion
REM check that first argument is a file
IF NOT EXIST %1 (
	ECHO %1 doesn't exists.
	EXIT /B 1
)
REM resolve Cygwin installation directory
CALL "%~dp0cygdir.cmd"
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
REM add Cygwin paths to environment
SET PATH=%CYGDIR%\usr\local\bin;%CYGDIR%\bin;%PATH%
REM compose arguments to argv[] array and set argc to the number of arguments
SET argc=0
FOR %%X IN (%*) DO (
	SET /A argc+=1
	REM if argument is a file
	IF EXIST %%X (
		REM translate to Cygwin path
		FOR /F "delims= usebackq" %%F IN (`cygpath.exe %%X`) DO (
			SET _arg="%%F"
		)
	) ELSE (
		SET _arg=%%X
	)
	SET argv[!argc!]=!_arg!
)
REM unset local variables
SET "_arg="
REM run script in Cygwin
START "Cygwin" "mintty.exe" --exec !argv[1]! ^
	!argv[2]! !argv[3]! !argv[4]! !argv[5]! ^
	!argv[6]! !argv[7]! !argv[8]! !argv[9]!
