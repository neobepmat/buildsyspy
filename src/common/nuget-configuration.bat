REM
REM -------------------------------------------------
REM Nuget Configuration file
REM 
REM -------------------------------------------------

REM --------------------------------
REM WARNING! ENABLE ONE FEED ONLY!!!
REM --------------------------------
SET LOCAL=0
SET FEEDZ=1

IF %LOCAL% == 1 (
	SET NUGET-FILENAME=Nuget-Local.config
)

IF %FEEDZ% == 1 (
	SET NUGET-FILENAME=Nuget-Feedz.config
)

ECHO Using Nuget Config File [%NUGET-FILENAME%] >> %LOG_FILE% 2>> %LOG_FILE_ERR%
