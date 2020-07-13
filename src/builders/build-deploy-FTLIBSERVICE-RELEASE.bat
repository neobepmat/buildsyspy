REM NOTHING
ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET BATCH_ROOT_MOUNTPOINT_COMMON=K:\GIT
IF NOT [%ROOT_MOUNTPOINT_COMMON%] == [] SET BATCH_ROOT_MOUNTPOINT_COMMON=%ROOT_MOUNTPOINT_COMMON%

rem -------------------------------------------

rem copia i files prodotti nella cartella del setup-source-tree

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src
SET DEPENDENCIES_FOLDER=Dependencies
SET SOLUTION_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\bitbucket-ft\UWFLib\UWFLib\FTLibService\FTLibService.csproj
SET SOLUTION_FOLDER_NUGET=%BATCH_ROOT_MOUNTPOINT_COMMON%\bitbucket-ft\UWFLib\UWFLib
SET OUTPUT_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\bitbucket-ft\UWFLib\UWFLib\bin
SET FTLIBSERVICE_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts\FTLibService

ECHO Sto generando la build in RELEASE del pacchetto FTLibService
ECHO percorso di MSBUILD: %PATH_MSBUILD%

ECHO Sto effettuando il restore dei pacchetti Nuget

"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SOLUTION_FOLDER%" -SolutionDirectory "%SOLUTION_FOLDER_NUGET%" -ConfigFile "%BATCH_FOLDER_VERSIONE%\bin\%NUGET-FILENAME%"

IF %ERRORLEVEL% NEQ 0 (
	SET BUILD_ERROR= 1
	EXIT /B
)

ECHO Sto eseguendo i target Clean e Rebuild della soluzione

"%PATH_MSBUILD%" "%SOLUTION_FOLDER%" /t:Clean,Rebuild /property:Configuration=Release /p:Platform=AnyCPU /p:OutputPath="%OUTPUT_FOLDER%" || SET BUILD_ERROR=1

ECHO Creo percorso %FTLIBSERVICE_FOLDER% se non esiste
if not exist "%FTLIBSERVICE_FOLDER%" mkdir "%FTLIBSERVICE_FOLDER%"

ECHO Rimuovo files dal percorso %FTLIBSERVICE_FOLDER%
DEL %FTLIBSERVICE_FOLDER%\*.* /Q

ECHO Sto copiando i files nella destinazione: %FTLIBSERVICE_FOLDER%

REM elenco delle DLL da copiare in DEPENDENCIES ed in RDP

COPY "%OUTPUT_FOLDER%\FTLibService.exe" %FTLIBSERVICE_FOLDER%
COPY "%OUTPUT_FOLDER%\FTLibService.exe.config" %FTLIBSERVICE_FOLDER%
COPY "%OUTPUT_FOLDER%\NLog.dll" %FTLIBSERVICE_FOLDER%
COPY "%OUTPUT_FOLDER%\UWFLib.dll" %FTLIBSERVICE_FOLDER%
COPY "%OUTPUT_FOLDER%\FTLibService.exe - Shortcut.lnk" %FTLIBSERVICE_FOLDER%

ECHO Operazione completata!