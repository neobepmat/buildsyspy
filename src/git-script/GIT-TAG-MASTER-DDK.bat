ECHO "Filename:" %0 1>&2

@ECHO Starting TAG procedure for branch [%BRANCH_TO_TAG_INTERNAL%] on folder [%GIT-ROOT%] > "%EXT_LOG_FILE%" 2>"%EXT_LOG_FILE_ERR%"

IF [%TAG%] == [] (
	@ECHO No Tag has been supplied - process interrupted. >> %EXT_LOG_FILE% 2>>"%EXT_LOG_FILE_ERR%"
	PAUSE
	EXIT /B
) 

@ECHO Applying Tag [%TAG%] to [MASTER] branch for all involved repositories. Continue?  >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
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

SET GIT_EXE=C:\Program Files (x86)\Git\cmd\git.exe

SET CURRENT_REPO=THEDARKKNIGHT DEVICE DRIVER
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\TheDarkKnightDeviceDriver
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=THEDARKKNIGHT DEVICE DRIVER SETUP
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\FT10Setup-TDKDeviceDriver
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"