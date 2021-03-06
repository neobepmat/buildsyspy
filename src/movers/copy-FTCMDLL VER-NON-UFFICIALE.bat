ECHO "Filename:" %0 1>&2

SET FTCM_VERSIONE=13.0.0
SET TDK_VERSIONE=13.0.0

IF NOT [%VERSIONE%] == [] SET FTCM_VERSIONE=%VERSIONE%
IF NOT [%VERSIONE%] == [] SET TDK_VERSIONE=%VERSIONE%

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET MAIN_TARGET_INTERNAL=12
IF NOT [%MAIN_TARGET%] == [] SET MAIN_TARGET_INTERNAL=%MAIN_TARGET%

REM --------------------------------------

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src
SET RFID_VERSIONE=1.3.0
SET FTCM_SYS_FOLDER=C:\FTSYSTEM\BIN

IF %MAIN_TARGET_INTERNAL% == 12 (
	SET FTCM_TEMPLATE_INI_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts\TEMPLATE-INI-FTCONTROLMANAGER\12
)

SET FTCM_EXE_DESTINATION_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts\EXE_NON_UFFICIALI\%FTCM_VERSIONE%
SET TDK_DESTINATION_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts\THEDARKKNIGHT_NON_UFFICIALI\%TDK_VERSIONE%
SET RFID_DESTINATION_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts\RFID\%RFID_VERSIONE%
SET BATCH_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src

if not exist "%TDK_DESTINATION_FOLDER%" mkdir "%TDK_DESTINATION_FOLDER%"
if not exist "%FTCM_EXE_DESTINATION_FOLDER%" mkdir "%FTCM_EXE_DESTINATION_FOLDER%"

REM @ECHO Removing all files from folder [%TDK_DESTINATION_FOLDER%]
REM DEL "%TDK_DESTINATION_FOLDER%\*.*" /Q /F
REM @ECHO Removing all files from folder [%FTCM_EXE_DESTINATION_FOLDER%]
REM DEL "%FTCM_EXE_DESTINATION_FOLDER%\*.*" /Q /F

CALL "%BATCH_FOLDER_VERSIONE%\movers\copy-FTCMDLL.bat" %FTCM_SYS_FOLDER%, %TDK_DESTINATION_FOLDER%, %RFID_DESTINATION_FOLDER%, %FTCM_EXE_DESTINATION_FOLDER%, %FTCM_TEMPLATE_INI_FOLDER%, %FTCM_VERSIONE%