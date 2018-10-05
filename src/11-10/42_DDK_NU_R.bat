REM =========================================
REM 04-10-2018, rilascio non ufficiale per RoboQCS
SET VERSIONE=11.11.100.2-develop
SET DO_GIT_CHECKOUT=1
SET RILASCIO_UFFICIALE=1
SET BRANCH_TO_CHECKOUT=develop-11-10
SET BRANCH_TO_CHECKOUT_COMMON=develop
SET CONFIGURATION=Release
REM =========================================

SET ROOT_MOUNTPOINT=C:\GIT-11-10-beta

SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\BuildSystem

SET ROOT_MOUNTPOINT_COMMON=c:\GIT-COMMON

REM CREAZIONE DIRECTORY PER I BINARY PRODOTTI
SET BATCH_FOLDER=%ROOT_FOLDER%\src

MKDIR "%BATCH_FOLDER%\log"

SET LOG_FILE=%BATCH_FOLDER%\log\SETUP_DEVICEDRIVER_11-10_develop.LOG
SET LOG_FILE_ERR=%BATCH_FOLDER%\log\SETUP_DEVICEDRIVER_ERR_11-10_develop.LOG

SET TDK_11_4=0
SET DEVICE_DRIVER_VERSION=%VERSIONE%
SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\MSBUILD.EXE
SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

REM PULISCE LE CARTELLE IN CUI VERRANNO COPIATI I FILES, CANCELLA I FILES DI LOG 
ECHO Inizializzazione log per generazione setup TDK Device Driver > %LOG_FILE% 2>%LOG_FILE_ERR%
ECHO Sto generando la versione [%DEVICE_DRIVER_VERSION%]

SET GIT_ROOT=%ROOT_MOUNTPOINT%

IF %DO_GIT_CHECKOUT% == 1 (
	ECHO ---effettua il checkout delle branch GIT
	call "%BATCH_FOLDER%\git-script\GIT-CHECKOUT.bat" %GIT_ROOT% %BRANCH_TO_CHECKOUT% >> %LOG_FILE% 2>%LOG_FILE_ERR%
)

CALL "%BATCH_FOLDER%\common\42_DDK.BAT"

pause