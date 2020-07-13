REM
REM Init batch script for all configuration initializations

ECHO Running Init Configuration >> %LOG_FILE% 2>> %LOG_FILE_ERR%

CALL "%BATCH_FOLDER%\common\nuget-configuration.bat" %1

CALL "%BATCH_FOLDER%\common\nuget-clear-local-cache.bat"