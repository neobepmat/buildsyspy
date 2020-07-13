ECHO "Filename:" %0 1>&2

@ECHO Starting TAG procedure for branch [%BRANCH_12_TO_TAG_INTERNAL%] on folder [%GIT-ROOT%] > "%EXT_LOG_FILE%" 2>"%EXT_LOG_FILE_ERR%"
@ECHO for branch [%BRANCH_COMMON_TO_TAG_INTERNAL%] on folder [%GIT-ROOT-COMMON%] > "%EXT_LOG_FILE%" 2>"%EXT_LOG_FILE_ERR%"

IF [%TAG_BUILDSYSTEM%] == [] (
	@ECHO No Tag has been supplied - process interrupted. >> %EXT_LOG_FILE% 2>>"%EXT_LOG_FILE_ERR%"
	PAUSE
	EXIT /B
) 

@ECHO Applying Tag [%TAG_BUILDSYSTEM%] for all involved repositories. Continue?  >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
CHOICE /C YN /M "Select [Y] Yes or [N] No"

IF %errorlevel% == 1 goto sub_YES
IF %errorlevel% == 2 goto sub_NO

:sub_NO
@ECHO The user has chosen NO : the batch file will be terminated >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
PAUSE
EXIT /B

:sub_YES
@ECHO The user has chosen YES : the batch file will continue >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
PAUSE

SET GIT_EXE=C:\Program Files\Git\cmd\git.exe

SET CURRENT_REPO=BUILDSYSTEM
SET CURRENT_FOLDER=%GIT-ROOT%\bitbucket-ft\buildsystem
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_12_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"