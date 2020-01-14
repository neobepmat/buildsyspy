ECHO "Filename:" %0 1>&2

SET VERSIONE_INTERNAL=13.0.0
IF NOT [%VERSIONE%] == [] SET VERSIONE_INTERNAL=%VERSIONE%

SET VERSIONE_WITH_TEXT_INTERNAL=13.0.0-master
IF NOT [%VERSIONE_WITH_TEXT%] == [] SET VERSIONE_WITH_TEXT_INTERNAL=%VERSIONE_WITH_TEXT%

SET INTERNO_RILASCIO_UFFICIALE=1
IF NOT [%RILASCIO_UFFICIALE%] == [] SET INTERNO_RILASCIO_UFFICIALE=%RILASCIO_UFFICIALE%

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET BATCH_ROOT_MOUNTPOINT_COMMON=K:\GIT
IF NOT [%ROOT_MOUNTPOINT_COMMON%] == [] SET BATCH_ROOT_MOUNTPOINT_COMMON=%ROOT_MOUNTPOINT_COMMON%

SET INTERNAL_WIX_TARGETSPATH=$(MSBuildExtensionsPath)\Microsoft\WiX\v3.x\Wix.targets
IF NOT ["%WIX_TARGETSPATH%"] == [""] SET INTERNAL_WIX_TARGETSPATH="%WIX_TARGETSPATH%"

SET INTERNAL_WIXCA_TARGETSPATH=$(MSBuildExtensionsPath)\Microsoft\WiX\v3.x\Wix.ca.targets
IF NOT ["%WIXCA_TARGETSPATH%"] == [""] SET INTERNAL_WIXCA_TARGETSPATH="%WIXCA_TARGETSPATH%"

SET INTERNAL_MAIN_TARGET=12
IF NOT [%MAIN_TARGET%] == [] SET INTERNAL_MAIN_TARGET=%MAIN_TARGET%

REM --------------------------------------

SET SLN_TDK_SETUP=%BATCH_ROOT_MOUNTPOINT_COMMON%\bitbucket-ft\setup-hmi\setup-project\setup-project.sln

SET OUTPUT_PATH=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src\msi-output\SETUPFT10

SET PACKAGE_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\bitbucket-ft\setup-hmi\setup-project\setup-project\Packages\en-us

@ECHO --deleting old files in [%PACKAGE_FOLDER%]
DEL %PACKAGE_FOLDER%\*.* /Q

SET FT_SOURCEDIR=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts
SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src

REM restoring nuget packages
"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SLN_TDK_SETUP%"

"%PATH_MSBUILD%" "%SLN_TDK_SETUP%" /P:VERSIONE_WITH_TEXT=%VERSIONE_WITH_TEXT_INTERNAL% /P:WixCATargetsPath=%INTERNAL_WIXCA_TARGETSPATH% /P:WixTargetsPath=%INTERNAL_WIX_TARGETSPATH% /P:CONFIGURATION=Release /T:Clean,Build /P:PLATFORM=x86 /p:RILASCIO_UFFICIALE="%INTERNO_RILASCIO_UFFICIALE%" /p:THEDARKKNIGHT_VERSION="%VERSIONE_INTERNAL%" /p:EXE_VERSION="%VERSIONE_INTERNAL%" /p:FT_SOURCEDIR="%FT_SOURCEDIR%" /p:MAIN_TARGET=%MAIN_TARGET%

IF NOT EXIST "%OUTPUT_PATH%" MKDIR "%OUTPUT_PATH%"

MOVE "%PACKAGE_FOLDER%\*.*" "%OUTPUT_PATH%"