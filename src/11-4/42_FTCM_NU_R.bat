REM =========================================
REM 23-07-2018, rilascio non ufficiale per QCS
SET VERSIONE=11.5.100.1
SET VERSIONE_WITH_TEXT=%VERSIONE%-develop
SET DO_GIT_CHECKOUT=1
SET BRANCH_TO_CHECKOUT=develop
SET RILASCIO_UFFICIALE=0
SET MAIN_TARGET=11-4
REM =========================================

SET ROOT_MOUNTPOINT=C:\GIT-11-4-beta
SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\BuildSystem
SET ROOT_MOUNTPOINT_COMMON=C:\GIT-COMMON

SET GIT_FOLDER=%ROOT_FOLDER%\src
SET BIN_FTCM=%ROOT_FOLDER%\artifacts\Exe_non_ufficiali
SET BIN_TDK=%ROOT_FOLDER%\artifacts\TheDarkKnight_non_ufficiali
SET BIN_DEPENDENCIES=%ROOT_FOLDER%\artifacts\dependencies
SET RDP_FOLDER=%ROOT_FOLDER%\artifacts\RDP\2.0.0
SET TCPIP_FOLDER=%ROOT_FOLDER%\artifacts\TCPIP\4.0.0
SET RFID_FOLDER=%ROOT_FOLDER%\artifacts\RFID\1.3.0

MKDIR "%ROOT_FOLDER%\src\log"

SET LOG_FILE=%ROOT_FOLDER%\src\log\SETUP_11-4_develop.LOG
SET LOG_FILE_ERR=%ROOT_FOLDER%\src\log\SETUP_ERR_11-4_develop.LOG

SET STANDALONE=0
SET VB6_OUTPUT=%BIN_FTCM%\%VERSIONE%

SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\MSBUILD.EXE
SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

REM cancella i files di LOG
ECHO Inizializzazione dei files di log 1> %LOG_FILE% 2> %LOG_FILE_ERR%

SET GIT_ROOT=%ROOT_MOUNTPOINT%

IF %DO_GIT_CHECKOUT% == 1 (
	REM effettua il checkout delle branch GIT
	call "%GIT_FOLDER%\git-script\GIT-CHECKOUT.bat" %GIT_ROOT% %BRANCH_TO_CHECKOUT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%
)

CALL "%ROOT_FOLDER%\src\common\42_FTCM.BAT"

PAUSE