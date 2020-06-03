REM =========================================
REM 29-05-2020, rilascio con FTSystem.RDP integrazione VNC, branch FTCM12-52
SET VERSIONE=101.0.43.0
SET VERSIONE_WITH_TEXT=%VERSIONE%-develop
SET RILASCIO_UFFICIALE=0
SET MAIN_TARGET=12
REM =========================================

SET TEMP_DRIVE_LETTER=K:
NET USE %TEMP_DRIVE_LETTER% \\VBOXSRV\C_DRIVE

SET ROOT_MOUNTPOINT=%TEMP_DRIVE_LETTER%\GIT\
SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem
SET ROOT_MOUNTPOINT_COMMON=%TEMP_DRIVE_LETTER%\GIT

SET BATCH_FOLDER=%ROOT_FOLDER%\src
SET BIN_FTCM=%ROOT_FOLDER%\artifacts\Exe_non_ufficiali
SET BIN_TDK=%ROOT_FOLDER%\artifacts\TheDarkKnight_non_ufficiali
SET BIN_DEPENDENCIES=%ROOT_FOLDER%\artifacts\dependencies
SET RDP_FOLDER=%ROOT_FOLDER%\artifacts\RDP\2.0.0
SET TCPIP_FOLDER=%ROOT_FOLDER%\artifacts\TCPIP\4.0.0
SET RFID_FOLDER=%ROOT_FOLDER%\artifacts\RFID\1.3.0

MKDIR "%ROOT_FOLDER%\src\log"

SET LOG_FILE=%ROOT_FOLDER%\src\log\SETUP_FTCM_12_develop.LOG
SET LOG_FILE_ERR=%ROOT_FOLDER%\src\log\SETUP_FTCM_ERR_12_develop.LOG

SET STANDALONE=0
SET VB6_OUTPUT=%BIN_FTCM%\%VERSIONE%

SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\MSBUILD.EXE
SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

REM cancella i files di LOG
ECHO Inizializzazione dei files di log 1> %LOG_FILE% 2> %LOG_FILE_ERR%

CALL "%BATCH_FOLDER%\common\42_FTCM.BAT"

NET USE %TEMP_DRIVE_LETTER% /DELETE

PAUSE
