REM 
REM ----------------------------------------
REM Nuget clearing all local package cache
REM ----------------------------------------

ECHO Clearing Nuget local cache >> %LOG_FILE% 2>> %LOG_FILE_ERR%

nuget locals all -clear