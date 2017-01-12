@ECHO OFF
SETLOCAL EnableDelayedExpansion
REM check that first argument is a file
IF NOT EXIST %1 (
	ECHO %1 doesn't exists
	EXIT /B 1
)
REM Cygwin installation directory
SET CYGPATH=C:\cygwin
REM add Cygwin paths to environment
SET PATH=%CYGPATH%\usr\local\bin;%CYGPATH%\bin;%PATH%
REM compose arguments to A[] array
SET argc=0
FOR %%x IN (%*) DO (
	SET /A argc+=1
	REM if argument is a file
	IF EXIST %%x (
		REM translate to Cygwin path
		FOR /F "delims= usebackq" %%F IN (`cygpath.exe %%x`) DO (
			SET _arg="%%F"
		)
	) ELSE (
		SET _arg=%%x
	)
	SET argv[!argc!]=!_arg!
)
REM unset local variables
SET "_i="
SET "_arg="
REM run script in Cygwin
START "Cygwin" "mintty.exe" --exec !argv[1]! ^
	!argv[2]! !argv[3]! !argv[4]! !argv[5]! ^
	!argv[6]! !argv[7]! !argv[8]! !argv[9]!
