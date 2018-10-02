REM =========================================
REM script di esecuzione in modalità standalone di TDK in modalità DESIGN su PLATFORM x86
REM =========================================

REM MAPPING TEMPORANEO PER UAC
REM ATTENZIONE, DEVE ESISTERE LO SHARE QUI SOTTO INDICATO - DA DEFINIRE IN VIRTUAL BOX COME DIRECTORY DI MACCHINA
NET USE Z: \\VBOXSRV\C_DRIVE

REM UNITA LOGICA CHE VIENE USATA COME PUNTO DI INGRESSO, USUALMENTE è Z: E VIENE MONTATO CON ISTRUZIONE "NET USE" IN QUESTO STESSO BATCH
REM VIENE QUI MONTATO PERCHE' DEVE ESSERE VISIBILE COME UAC - QUESTI SCRIPT VENGONO ESEGUITI CON PRIVILEGI UAC PER MOTIVI DI REGISTRAZIONI OGGETTI COM
SET ROOT_MOUNTPOINT=Z:\GIT

SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\BuildSystem
SET BATCH_FOLDER=%ROOT_FOLDER%\src
SET ROOT_MOUNTPOINT_COMMON=Z:\GIT

MKDIR "%BATCH_FOLDER%\log"

SET LOG_FILE=%ROOT_FOLDER%\src\log\SETUP_standalone.LOG
SET LOG_FILE_ERR=%ROOT_FOLDER%\src\log\SETUP_ERR_standalone.LOG
SET VB6_OUTPUT=D:\FTCONTROLSMANAGER
SET FTSHUTDOWN_OUTPUT_FOLDER=D:\FTCONTROLSMANAGER\FTSYSTEMSHUTDOWN
SET VERSIONE=11.4.0.0
SET VERSIONE_WITH_TEXT=11.4.0.0-standalone
SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\MSBUILD.EXE
SET STANDALONE=0

REM cancella i files di LOG
ECHO Inizializzazione dei files di log 1> %LOG_FILE% 2> %LOG_FILE_ERR%

DEL /S C:\FTSystem\Bin\ /Q >> %LOG_FILE% 2>> %LOG_FILE_ERR%

call "%BATCH_FOLDER%\builders\build-deploy-FTLIBSERVICE-RELEASE" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% "%PATH_MSBUILD%" >> %LOG_FILE% 2>> %LOG_FILE_ERR%

call "%BATCH_FOLDER%\builders\build-deploy-RDP-RELEASE.bat" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% "%PATH_MSBUILD%" >> %LOG_FILE% 2>> %LOG_FILE_ERR%

call "%BATCH_FOLDER%\builders\build-deploy-TCPIP-RELEASE.bat" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% "%PATH_MSBUILD%" >> %LOG_FILE% 2>> %LOG_FILE_ERR%

call "%BATCH_FOLDER%\builders\build-deploy-FTSYSTEMSHUTDOWN-RELEASE.bat" %BATCH_FOLDER% %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% "%PATH_MSBUILD%" %FTSHUTDOWN_OUTPUT_FOLDER% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

call "%BATCH_FOLDER%\builders\build-TDK-DESIGN.bat" %ROOT_MOUNTPOINT% %PATH_MSBUILD% 1>> %LOG_FILE% 2>> %LOG_FILE_ERR%

call "%BATCH_FOLDER%\builders\build-OVERLORD.bat" %VERSIONE_WITH_TEXT% %VERSIONE% %ROOT_MOUNTPOINT% %VB6_OUTPUT% %STANDALONE% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

call "%BATCH_FOLDER%\builders\build-DEVICEDRIVER-RELEASE.bat" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM RIMOZIONE MAPPING TEMPORANEO
NET USE Z: /DELETE

PAUSE