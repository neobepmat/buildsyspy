ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET INTERNAL_DEVICE_DRIVER_VERSION_WITH_TEXT=101.0.0.0-test
IF NOT [%DEVICE_DRIVER_VERSION_WITH_TEXT%] == [] SET INTERNAL_DEVICE_DRIVER_VERSION_WITH_TEXT=%DEVICE_DRIVER_VERSION_WITH_TEXT%

SET BATCH_ROOT_MOUNTPOINT_COMMON=K:\GIT
IF NOT [%ROOT_MOUNTPOINT_COMMON%] == [] SET BATCH_ROOT_MOUNTPOINT_COMMON=%ROOT_MOUNTPOINT_COMMON%

SET INTERNAL_WIX_TARGETSPATH=$(MSBuildExtensionsPath)\Microsoft\WiX\v3.x\Wix.targets
IF NOT ["%WIX_TARGETSPATH%"] == [""] SET INTERNAL_WIX_TARGETSPATH="%WIX_TARGETSPATH%"

SET INTERNAL_WIXCA_TARGETSPATH=$(MSBuildExtensionsPath)\Microsoft\WiX\v3.x\Wix.ca.targets
IF NOT ["%WIXCA_TARGETSPATH%"] == [""] SET INTERNAL_WIXCA_TARGETSPATH="%WIXCA_TARGETSPATH%"

SET VERSIONE_WITH_TEXT_INTERNAL=101.0.0-master
IF NOT [%VERSIONE_WITH_TEXT%] == [] SET VERSIONE_WITH_TEXT_INTERNAL=%VERSIONE_WITH_TEXT%

REM ------------------------------------------------------------------------

SET SLN_DEVICEDRIVER_SETUP=%BATCH_ROOT_MOUNTPOINT_COMMON%\bitbucket-ft\setup-ddk\setup-tdkdevicedriver.sln

SET OUTPUT_PATH=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src\msi-output\setup-ddk
SET PACKAGE_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\bitbucket-ft\setup-ddk\setup-project\Packages\en-us

@ECHO --deleting old files in [%PACKAGE_FOLDER%]
DEL %PACKAGE_FOLDER%\*.* /Q

@ECHO ---restoring nuget packages
"%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src\bin\nuget.exe" restore "%SLN_DEVICEDRIVER_SETUP%"

@ECHO ---building solution "%SLN_DEVICEDRIVER_SETUP%"
"%PATH_MSBUILD%" "%SLN_DEVICEDRIVER_SETUP%" /P:FT_SOURCEDIR=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts /P:WixCATargetsPath=%INTERNAL_WIXCA_TARGETSPATH% /P:WixTargetsPath=%INTERNAL_WIX_TARGETSPATH% /P:CONFIGURATION=Release /T:Rebuild /P:PLATFORM=x86 /P:DEVICE_DRIVER_VERSION_WITH_TEXT=%INTERNAL_DEVICE_DRIVER_VERSION_WITH_TEXT% /P:VERSIONE=%VERSIONE% || SET BUILD_ERROR=1

@ECHO ---creating output folder "%OUTPUT_PATH%"
MKDIR "%OUTPUT_PATH%"

@ECHO ---copying msi package
COPY "%PACKAGE_FOLDER%\*.*" "%OUTPUT_PATH%"