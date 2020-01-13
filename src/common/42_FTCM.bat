
SET BUILD_ERROR=0
SET MODULE_ERROR=Undefined

rem GOTO :TEST_TCPIP_FEATURE

RMDIR /Q /S "%BIN_DEPENDENCIES%"
 
IF NOT EXIST "%BIN_FTCM%" MKDIR "%BIN_FTCM%"
IF NOT EXIST "%BIN_TDK%" MKDIR "%BIN_TDK%"
IF NOT EXIST "%BIN_DEPENDENCIES%" MKDIR "%BIN_DEPENDENCIES%"
IF NOT EXIST "%RDP_FOLDER%" MKDIR "%RDP_FOLDER%"
IF NOT EXIST "%TCPIP_FOLDER%" MKDIR "%TCPIP_FOLDER%"
IF NOT EXIST "%RFID_FOLDER%" MKDIR "%RFID_FOLDER%"
  
DEL "%BIN_DEPENDENCIES%\*.*" /Q /F 1>> %LOG_FILE% 2>> %LOG_FILE_ERR%
 
DEL "%BIN_FTCM%\%VERSIONE%\*.*" /Q /F 1>> %LOG_FILE% 2>> %LOG_FILE_ERR%

DEL "%BIN_TDK%\%VERSIONE%\*.*" /Q /F 1>> %LOG_FILE% 2>> %LOG_FILE_ERR%

DEL "C:\FTSYSTEM\BIN\*.*" /Q /F 1>> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM =========================================

:TEST_FTLIBSERVICE_FEATURE

call "%BATCH_FOLDER%\builders\build-deploy-FTLIBSERVICE-RELEASE" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% "%PATH_MSBUILD%" >> %LOG_FILE% 2>> %LOG_FILE_ERR%

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=FTLIBSERVICE_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)

rem pause

:TEST_SMARTPCSDLL_FEATURE

rem call "%BATCH_FOLDER%\build-SMARTPCSDLL-RELEASE.bat" %BATCH_FOLDER% %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

REM pause

:TEST_RDP_FEATURE

call "%BATCH_FOLDER%\builders\build-deploy-RDP-RELEASE.bat" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% %PATH_MSBUILD% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=RDP_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)
REM pause

:TEST_TCPIP_FEATURE

IF %MAIN_TARGET% EQU 12 (
	call "%BATCH_FOLDER%\builders\build-deploy-TCPIP-RELEASE.bat" "%ROOT_MOUNTPOINT%" "%ROOT_MOUNTPOINT_COMMON%" "%PATH_MSBUILD%" >> %LOG_FILE% 2>> %LOG_FILE_ERR%
)

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=TCPIP_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)

rem PAUSE

:TEST_FTSYSTEMSHUTDOWN_FEATURE

call "%BATCH_FOLDER%\builders\build-deploy-FTSYSTEMSHUTDOWN-RELEASE.bat" %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% %PATH_MSBUILD% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=FTSYSTEMSHUTDOWN_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)
REM pause

:TEST_DESIGNTDK_FEATURE

call "%BATCH_FOLDER%\builders\build-TDK-DESIGN.bat" %ROOT_MOUNTPOINT% "%PATH_MSBUILD%" >> %LOG_FILE% 2>> %LOG_FILE_ERR%

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=DESIGNTDK_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)
REM pause

:TEST_BUILDOVERLORD_FEATURE

call "%BATCH_FOLDER%\builders\build-OVERLORD.bat" %VB6_OUTPUT% %STANDALONE% %VERSIONE_WITH_TEXT% %VERSIONE% %ROOT_MOUNTPOINT% %MAIN_TARGET% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=OVERLORD_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)
REM pause

:TEST_TDKBUILDRELEASE_FEATURE

call "%BATCH_FOLDER%\builders\build-TDK-RELEASE.bat" %ROOT_MOUNTPOINT% "%PATH_MSBUILD%" >> %LOG_FILE% 2>> %LOG_FILE_ERR%

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=TDKBUILDRELEASE_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)
REM pause

:TEST_COPYDEPENDENCIES_FEATURE

call "%BATCH_FOLDER%\movers\copy-DEPENDENCIES.bat" %ROOT_MOUNTPOINT% %BATCH_FOLDER% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=COPYDEPENDENCIES_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)
REM pause

:TEST_COPYFTCMDLL_FEATURE

IF %RILASCIO_UFFICIALE% == 1 (
	call "%BATCH_FOLDER%\movers\copy-FTCMDLL VER-UFFICIALE.bat" %VERSIONE% %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%
	IF %BUILD_ERROR% == 1 (
		SET MODULE_ERROR=COPYFTCMDLL_FEATURE
		CALL "%BATCH_FOLDER%\common\banner_error.bat"
	)
)

IF %RILASCIO_UFFICIALE% == 0 (
	call "%BATCH_FOLDER%\movers\copy-FTCMDLL VER-NON-UFFICIALE.bat" %VERSIONE% %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%
	IF %BUILD_ERROR% == 1 (
		SET MODULE_ERROR=COPYFTCMDLL_FEATURE
		CALL "%BATCH_FOLDER%\common\banner_error.bat"
	)
)

REM pause

:TEST_SETUP_FEATURE

CALL "%BATCH_FOLDER%\setup\setup-TDK-RELEASE.bat" %VERSIONE_WITH_TEXT% %VERSIONE% %RILASCIO_UFFICIALE% %ROOT_MOUNTPOINT% %ROOT_MOUNTPOINT_COMMON% %PATH_MSBUILD% %WIX_TARGETSPATH% %WIXCA_TARGETSPATH% %MAIN_TARGET%>> %LOG_FILE% 2>> %LOG_FILE_ERR%

IF %BUILD_ERROR% == 1 (
	SET MODULE_ERROR=SETUP_FEATURE
	CALL "%BATCH_FOLDER%\common\banner_error.bat"
)
rem pause

:TEST_ZIP_FEATURE

SET EXE_PDB_FOLDER=%BIN_FTCM%\%VERSIONE%\*.PDB
SET FTCM_PDB_FOLDER=%BIN_TDK%\%VERSIONE%\*.PDB
SET ZIP_FILENAME=FTCM_PDB_%VERSIONE_WITH_TEXT%.ZIP

call "%BATCH_FOLDER%\movers\zip-pdb-files.bat" %VERSIONE% %RILASCIO_UFFICIALE% %ZIP_FILENAME% %FTCM_PDB_FOLDER% %EXE_PDB_FOLDER% %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%