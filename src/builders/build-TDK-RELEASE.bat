ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

rem ------------------------------------------------------------------------

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src
SET SLN_TDK=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\tdk12\FTSystem.ControlsManager.sln
SET PRJ_VB6BRIDGE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\tdk12\FT.CM.VB6Bridge\FT.CM.VB6Bridge.csproj

REM restoring nuget packages
"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SLN_TDK%" -ConfigFile "%BATCH_FOLDER_VERSIONE%\bin\%NUGET-FILENAME%"

IF NOT %ERRORLEVEL% == 0 (
	SET BUILD_ERROR = 1
	GOTO END
)

rem "%PATH_MSBUILD%" "%PRJ_VB6BRIDGE%" /P:CONFIGURATION=Release /T:Clean /P:PLATFORM=x86 || SET BUILD_ERROR=1

"%PATH_MSBUILD%" "%SLN_TDK%" /P:CONFIGURATION=Release /T:Clean,Rebuild /P:PLATFORM=x86 /m:1 || SET BUILD_ERROR=1

REM PAUSE