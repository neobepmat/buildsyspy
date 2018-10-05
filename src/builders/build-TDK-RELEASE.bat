ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

rem ------------------------------------------------------------------------

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\src
SET SLN_TDK=%BATCH_ROOT_MOUNTPOINT%\TheDarkKnight\FTSystem.ControlsManager.sln
SET PRJ_VB6BRIDGE=%BATCH_ROOT_MOUNTPOINT%\TheDarkKnight\FT.CM.VB6Bridge\FT.CM.VB6Bridge.csproj

REM restoring nuget packages
"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SLN_TDK%"

"%PATH_MSBUILD%" "%PRJ_VB6BRIDGE%" /P:CONFIGURATION=Release /T:Clean /P:PLATFORM=x86

"%PATH_MSBUILD%" "%SLN_TDK%" /P:CONFIGURATION=Release /T:Clean,Rebuild /P:PLATFORM=x86

REM PAUSE