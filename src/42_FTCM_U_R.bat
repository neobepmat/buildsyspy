REM =========================================
REM data di rilascio ufficiale 20-09-2018
SET VERSIONE=11.4.10.1
SET DO_GIT_CHECKOUT=1
SET BRANCH_TO_CHECKOUT=master
REM =========================================

SET RILASCIO_UFFICIALE=1

SET ROOT_MOUNTPOINT=C:\GIT-11-4
SET ROOT_FOLDER=%ROOT_MOUNTPOINT%\BuildSystem
SET ROOT_MOUNTPOINT_COMMON=C:\GIT-COMMON

SET BATCH_FOLDER=%ROOT_FOLDER%\src
SET BIN_FTCM=%ROOT_FOLDER%\artifacts\Exe
SET BIN_TDK=%ROOT_FOLDER%\artifacts\TheDarkKnight
SET BIN_DEPENDENCIES=%ROOT_FOLDER%\artifacts\dependencies
SET RDP_FOLDER=%ROOT_FOLDER%\artifacts\RDP\2.0.0
SET TCPIP_FOLDER=%ROOT_FOLDER%\artifacts\TCPIP\4.0.0
SET RFID_FOLDER=%ROOT_FOLDER%\artifacts\RFID\1.3.0
SET LOG_FILE=%ROOT_FOLDER%\src\log\SETUP.LOG
SET LOG_FILE_ERR=%ROOT_FOLDER%\src\log\SETUP_ERR.LOG
SET VERSIONE_WITH_TEXT=%VERSIONE%-master

SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\MSBUILD.EXE

SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

IF [%DO_GIT_CHECKOUT%] == 1 (
	REM effettua il checkout delle branch GIT
	call "%BATCH_FOLDER%\git-script\GIT-CHECKOUT.bat" %BRANCH_TO_CHECKOUT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%
)
REM cancella i files di LOG
ECHO Inizializzazione dei files di log 1> %LOG_FILE% 2> %LOG_FILE_ERR%

REM GOTO :TEST_ZIP_FEATURE

RMDIR /Q /S "%BIN_DEPENDENCIES%"
 
IF NOT EXIST "%BIN_FTCM%" MKDIR "%BIN_FTCM%"
IF NOT EXIST "%BIN_TDK%" MKDIR "%BIN_TDK%"
IF NOT EXIST "%BIN_DEPENDENCIES%" MKDIR "%BIN_DEPENDENCIES%"
IF NOT EXIST "%RDP_FOLDER%" MKDIR "%RDP_FOLDER%"
IF NOT EXIST "%TCPIP_FOLDER%" MKDIR "%TCPIP_FOLDER%"
IF NOT EXIST "%RFID_FOLDER%" MKDIR "%RFID_FOLDER%"
 
REM PULISCE LE CARTELLE IN CUI VERRANNO COPIATI I FILES
 
DEL "%LOG_FILE%" /Q
 
DEL "%LOG_FILE_ERR%" /Q

DEL "%BIN_DEPENDENCIES%\*.*" /Q /F 1>> %LOG_FILE% 2>> %LOG_FILE_ERR%
 
DEL "%BIN_FTCM%\%VERSIONE%\*.*" /Q /F 1>> %LOG_FILE% 2>> %LOG_FILE_ERR%

DEL "%BIN_TDK%\%VERSIONE%\*.*" /Q /F 1>> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM =========================================

:TEST_FTLIBSERVICE_FEATURE

call "%BATCH_FOLDER%\builders\build-deploy-FTLIBSERVICE-RELEASE" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% %PATH_MSBUILD% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

rem pause

:TEST_SMARTPCSDLL_FEATURE

rem call "%BATCH_FOLDER%\build-SMARTPCSDLL-RELEASE.bat" %BATCH_FOLDER% %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause


:TEST_RDP_FEATURE

call "%BATCH_FOLDER%\builders\build-deploy-RDP-RELEASE.bat" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% %PATH_MSBUILD% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause

:TEST_TCPIP_FEATURE

call "%BATCH_FOLDER%\builders\build-deploy-TCPIP-RELEASE.bat" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% %PATH_MSBUILD% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause

:TEST_FTSYSTEMSHUTDOWN_FEATURE

call "%BATCH_FOLDER%\builders\build-deploy-FTSYSTEMSHUTDOWN-RELEASE.bat" %ROOT_MOUNTPOINT_COMMON% %ROOT_MOUNTPOINT% %PATH_MSBUILD% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause

:TEST_DESIGNTDK_FEATURE

call "%BATCH_FOLDER%\builders\build-TDK-DESIGN.bat" %ROOT_MOUNTPOINT% %PATH_MSBUILD% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

rem pause

:TEST_BUILDOVERLORD_FEATURE

call "%BATCH_FOLDER%\builders\build-OVERLORD ver-ufficiale.bat" %VERSIONE_WITH_TEXT% %VERSIONE% %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause

:TEST_TDKBUILDRELEASE_FEATURE

call "%BATCH_FOLDER%\builders\build-TDK-RELEASE.bat" %ROOT_MOUNTPOINT% %PATH_MSBUILD% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause

:TEST_COPYDEPENDENCIES_FEATURE

call "%BATCH_FOLDER%\movers\copy-DEPENDENCIES.bat" %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause


:TEST_COPYFTCMDLL_FEATURE

call "%BATCH_FOLDER%\movers\copy-FTCMDLL VER-UFFICIALE.bat" %VERSIONE_WITH_TEXT% %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause

:TEST_SETUP_FEATURE

CALL "%BATCH_FOLDER%\setup\setup-TDK-RELEASE.bat" %VERSIONE_WITH_TEXT% %VERSIONE% %RILASCIO_UFFICIALE% %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% %PATH_MSBUILD% %WIX_TARGETSPATH% %WIXCA_TARGETSPATH% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

rem pause

:TEST_ZIP_FEATURE

SET EXE_PDB_FOLDER=%BIN_FTCM%\%VERSIONE%\*.PDB
SET FTCM_PDB_FOLDER=%BIN_TDK%\%VERSIONE%\*.PDB
SET ZIP_FILENAME=FTCM_PDB_%VERSIONE_WITH_TEXT%.ZIP

call "%BATCH_FOLDER%\zip-pdb-files.bat" %VERSIONE% %RILASCIO_UFFICIALE% %ZIP_FILENAME% %FTCM_PDB_FOLDER% %EXE_PDB_FOLDER% %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

PAUSE