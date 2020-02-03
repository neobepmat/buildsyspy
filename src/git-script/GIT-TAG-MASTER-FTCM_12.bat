ECHO "Filename:" %0 1>&2

@ECHO Starting TAG procedure for branch [%BRANCH_12_TO_TAG_INTERNAL%] on folder [%GIT-ROOT%] > "%EXT_LOG_FILE%" 2>"%EXT_LOG_FILE_ERR%"
@ECHO for branch [%BRANCH_COMMON_TO_TAG_INTERNAL%] on folder [%GIT-ROOT-COMMON%] > "%EXT_LOG_FILE%" 2>"%EXT_LOG_FILE_ERR%"

IF [%TAG%] == [] (
	@ECHO No Tag has been supplied - process interrupted. >> %EXT_LOG_FILE% 2>>"%EXT_LOG_FILE_ERR%"
	PAUSE
	EXIT /B
) 

@ECHO Applying Tag [%TAG%] for all involved repositories. Continue?  >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
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

SET CURRENT_REPO=OVERLORD
SET CURRENT_FOLDER=%GIT-ROOT%\bitbucket-ft\overlord12
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_12_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=CONFIGURATORE_OVERLORD
SET CURRENT_FOLDER=%GIT-ROOT%\bitbucket-ft\hmiconfig12
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_12_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=THEDARKKNIGHT
SET CURRENT_FOLDER=%GIT-ROOT%\bitbucket-ft\tdk12
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_12_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=THEDARKKNIGHT SETUP
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\bitbucket-ft\setup-hmi
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_COMMON_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=FTSYSTEM SHUTDOWN
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\bitbucket-ft\ftsystem.ShutDownPC
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_COMMON_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=FTSYSTEM RDP
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\bitbucket-ft\ftsystem.RDP
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_COMMON_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=FTSYSTEM COMMUNICATION FRAMEWORK
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\bitbucket-ft\tdkcommunicationframework
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_COMMON_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=UWFLib
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\bitbucket-ft\uwflib
SET BRANCH_TO_TAG_INTERNAL=%BRANCH_COMMON_TO_TAG_INTERNAL%
SET DEMO=%DEMO%

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"