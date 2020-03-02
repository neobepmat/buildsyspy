﻿REM =========================================
REM 02-03-2020: Rilascio per Storico C1911 e bug storico localizzazioni
SET VERSIONE=1.2.0.0
SET RILASCIO_UFFICIALE=1
SET CONFIGURATION=Release
REM =========================================

SET TEMP_DRIVE_LETTER=K:
NET USE %TEMP_DRIVE_LETTER% \\VBOXSRV\C_DRIVE

SET ROOT_MOUNTPOINT=%TEMP_DRIVE_LETTER%\GIT\
SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem

SET BATCH_FOLDER=%ROOT_FOLDER%\src

MKDIR "%BATCH_FOLDER%\log"

SET LOG_FILE=%BATCH_FOLDER%\log\SETUP_DDK_12_master.LOG
SET LOG_FILE_ERR=%BATCH_FOLDER%\log\SETUP_DDK_ERR_12_master.LOG

SET DEVICE_DRIVER_VERSION_WITH_TEXT=%VERSIONE%-master
SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\MSBUILD.EXE
SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

REM PULISCE LE CARTELLE IN CUI VERRANNO COPIATI I FILES, CANCELLA I FILES DI LOG 
ECHO Inizializzazione log per generazione setup TDK Device Driver > %LOG_FILE% 2>%LOG_FILE_ERR%
ECHO Sto generando la versione [%DEVICE_DRIVER_VERSION_WITH_TEXT%]

CALL "%BATCH_FOLDER%\common\42_DDK.BAT"

NET USE %TEMP_DRIVE_LETTER% /DELETE

PAUSE