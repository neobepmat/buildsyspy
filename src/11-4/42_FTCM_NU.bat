﻿REM =========================================
REM 06-09-2019, 19-267 Bugfixing su salvataggio calibrazione Squeezer (C1911)
SET VERSIONE=11.5.116.1
SET VERSIONE_WITH_TEXT=%VERSIONE%-develop
SET RILASCIO_UFFICIALE=0
SET MAIN_TARGET=11-4
REM =========================================


REM CREAZIONE DIRECTORY PER I BINARY PRODOTTI

REM MAPPING TEMPORANEO PER UAC
REM ATTENZIONE, DEVE ESISTERE LO SHARE QUI SOTTO INDICATO - DA DEFINIRE IN VIRTUAL BOX COME DIRECTORY DI MACCHINA
NET USE Z: \\VBOXSRV\C_DRIVE

REM UNITA LOGICA CHE VIENE USATA COME PUNTO DI INGRESSO, USUALMENTE è Z: E VIENE MONTATO CON ISTRUZIONE "NET USE" IN QUESTO STESSO BATCH
REM VIENE QUI MONTATO PERCHE' DEVE ESSERE VISIBILE COME UAC - QUESTI SCRIPT VENGONO ESEGUITI CON PRIVILEGI UAC PER MOTIVI DI REGISTRAZIONI OGGETTI COM
SET ROOT_MOUNTPOINT=Z:\GIT
SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\BuildSystem
SET ROOT_MOUNTPOINT_COMMON=Z:\GIT

SET BATCH_FOLDER=%ROOT_FOLDER%\src
SET BIN_FTCM=%ROOT_FOLDER%\artifacts\Exe_non_ufficiali
SET BIN_TDK=%ROOT_FOLDER%\artifacts\TheDarkKnight_non_ufficiali
SET BIN_DEPENDENCIES=%ROOT_FOLDER%\artifacts\dependencies
SET RDP_FOLDER=%ROOT_FOLDER%\artifacts\RDP\2.0.0
SET TCPIP_FOLDER=%ROOT_FOLDER%\artifacts\TCPIP\4.0.0
SET RFID_FOLDER=%ROOT_FOLDER%\artifacts\RFID\1.3.0

MKDIR "%ROOT_FOLDER%\src\log"

SET LOG_FILE=%ROOT_FOLDER%\src\log\SETUP.LOG
SET LOG_FILE_ERR=%ROOT_FOLDER%\src\log\SETUP_ERR.LOG

SET STANDALONE=0
SET VB6_OUTPUT=%BIN_FTCM%\%VERSIONE%

SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\MSBUILD.EXE
SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

REM cancella i files di LOG
ECHO Inizializzazione dei files di log 1> %LOG_FILE% 2> %LOG_FILE_ERR%

CALL "%BATCH_FOLDER%\common\42_FTCM.BAT"

REM RIMOZIONE MAPPING TEMPORANEO
NET USE Z: /DELETE

PAUSE
