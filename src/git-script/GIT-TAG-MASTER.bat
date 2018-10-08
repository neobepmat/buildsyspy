ECHO "Filename:" %0 1>&2

@ECHO Starting TAG procedure for branch [%BRANCH_TO_TAG_INTERNAL%] on folder [%GIT-ROOT%] > "%EXT_LOG_FILE%" 2>&1

IF [%TAG%] == [] (
	@ECHO No Tag has been supplied - process interrupted. >> %EXT_LOG_FILE% 2>>&1
	PAUSE
	EXIT /B
) 

@ECHO Applying Tag [%TAG%] to [MASTER] branch for all involved repositories. Continue?  >> "%EXT_LOG_FILE%" 2>>&1
CHOICE /C YN /M "Select [Y] Yes or [N] No"

IF %errorlevel% == 1 goto sub_YES
IF %errorlevel% == 2 goto sub_NO

:sub_NO
@ECHO The user has chosen NO : the batch file will be terminated >> "%EXT_LOG_FILE%" 2>>&1
PAUSE
EXIT /B

:sub_YES
@ECHO The user has chosen YES : the batch file will continue >> "%EXT_LOG_FILE%" 2>>&1
PAUSE

SET GIT_EXE=C:\Program Files (x86)\Git\cmd\git.exe

SET CURRENT_REPO=OVERLORD
SET CURRENT_FOLDER=%GIT-ROOT%\Overlord

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=CONFIGURATORE_OVERLORD
SET CURRENT_FOLDER=%GIT-ROOT%\ConfiguratoreOverlord

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=THEDARKKNIGHT
SET CURRENT_FOLDER=%GIT-ROOT%\TheDarkKnight

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=THEDARKKNIGHT DEVICE DRIVER
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\TheDarkKnightDeviceDriver

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=THEDARKKNIGHT SETUP
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\FT10-Setup

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=THEDARKKNIGHT DEVICE DRIVER SETUP
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%\FT10Setup-TDKDeviceDriver

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=FTSYSTEM SHUTDOWN
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%/FTSystem.ShutDownPC

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=FTSYSTEM RDP
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%/FTSystem.RDP

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=FTSYSTEM COMMUNICATION FRAMEWORK
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%/FTSystemCommunicationFramework

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"

SET CURRENT_REPO=UWFLib
SET CURRENT_FOLDER=%GIT-ROOT-COMMON%/UWFLib.git

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-SINGLE_TAG.bat"