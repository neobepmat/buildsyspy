ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

rem ------------------------------------

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src
SET SLN_TDK=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\tdk12\FTSystem.ControlsManager.sln
SET PRJ_VB6BRIDGE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\tdk12\FT.CM.VB6Bridge\FT.CM.VB6Bridge.csproj

REM restoring nuget packages
"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SLN_TDK%"  -username nonameuser -password T-HUBB4eb6ycLd2ra0c0AlbBNX4JjlPpXP95E

REM CLEAN TDK

rem "%PATH_MSBUILD%" "%PRJ_VB6BRIDGE%" /P:CONFIGURATION=Design /T:Clean /P:PLATFORM=x86  || SET BUILD_ERROR=1

REM PAUSE
REM BUILDING TDK

"%PATH_MSBUILD%" "%SLN_TDK%" /P:CONFIGURATION=Design /T:Clean,Rebuild /P:PLATFORM=x86 || SET BUILD_ERROR=1

REM PAUSE