rem riga lasciata intenzionalmente vuota
SET VERSIONE=11.4.1.1-master
SET DO_GIT_CHECKOUT=1
SET RILASCIO_UFFICIALE=1
SET BRANCH_TO_CHECKOUT=master
REM =========================================

REM UNITA LOGICA CHE VIENE USATA COME PUNTO DI INGRESSO, USUALMENTE è Z: E VIENE MONTATO CON ISTRUZIONE "NET USE" IN QUESTO STESSO BATCH
REM VIENE QUI MONTATO PERCHE' DEVE ESSERE VISIBILE COME UAC - QUESTI SCRIPT VENGONO ESEGUITI CON PRIVILEGI UAC PER MOTIVI DI REGISTRAZIONI OGGETTI COM
SET ROOT_MOUNTPOINT=C:\GIT-11-4

SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\BuildSystem

SET ROOT_MOUNTPOINT_COMMON=c:\GIT-COMMON

REM CREAZIONE DIRECTORY PER I BINARY PRODOTTI
SET BATCH_FOLDER=%ROOT_FOLDER%\src

MKDIR "%BATCH_FOLDER%\log"

SET LOG_FILE=%BATCH_FOLDER%\log\SETUP_DEVICEDRIVER_master.LOG
SET LOG_FILE_ERR=%BATCH_FOLDER%\log\SETUP_DEVICEDRIVER_ERR_master.LOG

SET TDK_11_4=1
SET DEVICE_DRIVER_VERSION=%VERSIONE%
SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\MSBUILD.EXE
SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

REM PULISCE LE CARTELLE IN CUI VERRANNO COPIATI I FILES, CANCELLA I FILES DI LOG 
ECHO Inizializzazione log per generazione setup TDK Device Driver > %LOG_FILE% 2>%LOG_FILE_ERR%
ECHO Sto generando la versione [%DEVICE_DRIVER_VERSION%]

ECHO ---DO_GIT_CHECKOUT = [%DO_GIT_CHECKOUT%]
IF [%DO_GIT_CHECKOUT%] == [1] (
	ECHO ---effettua il checkout delle branch GIT
	SET GIT_ROOT=%ROOT_MOUNTPOINT%
	call "%BATCH_FOLDER%\git-script\GIT-CHECKOUT.bat" %GIT_ROOT% %BRANCH_TO_CHECKOUT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%
)

CALL %BATCH_FOLDER%\42_DDK.BAT

pause