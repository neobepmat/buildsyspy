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
SET FEEDZ_REMOTE=0

IF %1 == LOCAL (
	SET LOCAL=1
	SET FEEDZ=0
	SET FEEDZ_REMOTE=0
)

IF %1 == FEEDZ_LOCAL (
	SET LOCAL=0
	SET FEEDZ=1
	SET FEEDZ_REMOTE=0
)

IF %1 == FEEDZ_REMOTE (
	SET LOCAL=0
	SET FEEDZ=0
	SET FEEDZ_REMOTE=1
)

rem ---------------------------------------

IF %LOCAL% == 1 (
	SET NUGET-FILENAME=Nuget-Local.config
)

IF %FEEDZ% == 1 (
	SET NUGET-FILENAME=Nuget-Feedz.config
)

IF %FEEDZ_REMOTE% == 1 (
	SET NUGET-FILENAME=Nuget-Feedz-remote.config
)

ECHO Using Nuget Config File [%NUGET-FILENAME%] >> %LOG_FILE% 2>> %LOG_FILE_ERR%
