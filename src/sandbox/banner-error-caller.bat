@ECHO OFF

SET BUILD_ERROR=0
SET BANNER_SCRIPT=..\common\banner_error.bat
SET MODULE_ERROR=Module_Stikatsi
SET CALLER_NAME=%~f0

@ECHO Calling %BANNER_SCRIPT%

CALL "%BANNER_SCRIPT%"

@ECHO Exiting from %0

PAUSE