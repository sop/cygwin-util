@ECHO OFF
SETLOCAL EnableDelayedExpansion

REM check that first argument is a file
IF NOT EXIST %1 (
	ECHO %1 doesn't exists
	EXIT /B 1
)
REM compose arguments to A[] array
SET i=1
FOR %%x IN (%*) DO (
	REM if argument is a file
	IF EXIST %%x (
		REM translate to Cygwin path
		FOR /F "delims= usebackq" %%F IN (`C:\cygwin\bin\cygpath.exe %%x`) DO (
			SET arg="%%F"
		)
	) ELSE (
		SET arg=%%x
	)
	SET A[!i!]=!arg!
	SET /A i+=1
)
REM add Cygwin paths to environment
SET PATH=C:\cygwin\usr\local\bin;C:\cygwin\usr\bin;%PATH%
REM run script in Cygwin
START "Cygwin" "C:\cygwin\bin\mintty.exe" --exec ^
	!A[1]! !A[2]! !A[3]! !A[4]! !A[5]! !A[6]! !A[7]! !A[8]! !A[9]!
