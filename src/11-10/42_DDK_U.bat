﻿REM =========================================
REM data di rilascio ufficiale 09-10-2018
SET VERSIONE=11.10.1.1
SET RILASCIO_UFFICIALE=1
SET CONFIGURATION=Release
REM =========================================

REM MAPPING TEMPORANEO PER UAC
REM ATTENZIONE, DEVE ESISTERE LO SHARE QUI SOTTO INDICATO - DA DEFINIRE IN VIRTUAL BOX COME DIRECTORY DI MACCHINA
NET USE Z: \\VBOXSRV\C_DRIVE

REM UNITA LOGICA CHE VIENE USATA COME PUNTO DI INGRESSO, USUALMENTE è Z: E VIENE MONTATO CON ISTRUZIONE "NET USE" IN QUESTO STESSO BATCH
REM VIENE QUI MONTATO PERCHE' DEVE ESSERE VISIBILE COME UAC - QUESTI SCRIPT VENGONO ESEGUITI CON PRIVILEGI UAC PER MOTIVI DI REGISTRAZIONI OGGETTI COM
SET ROOT_MOUNTPOINT=Z:\GIT\

SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\BuildSystem
SET ROOT_MOUNTPOINT_COMMON=Z:\GIT

SET BATCH_FOLDER=%ROOT_FOLDER%\src

MKDIR "%BATCH_FOLDER%\log"

SET LOG_FILE=%BATCH_FOLDER%\log\SETUP_DEVICEDRIVER_11-10.LOG
SET LOG_FILE_ERR=%BATCH_FOLDER%\log\SETUP_DEVICEDRIVER_ERR_11-10.LOG

SET TDK_11_4=0
SET DEVICE_DRIVER_VERSION=%VERSIONE%-master
SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\MSBUILD.EXE
SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

REM PULISCE LE CARTELLE IN CUI VERRANNO COPIATI I FILES, CANCELLA I FILES DI LOG 
ECHO Inizializzazione log per generazione setup TDK Device Driver > %LOG_FILE% 2>%LOG_FILE_ERR%
ECHO Sto generando la versione [%DEVICE_DRIVER_VERSION%]

CALL "%BATCH_FOLDER%\common\42_DDK.BAT"

NET USE Z: /DELETE

PAUSE