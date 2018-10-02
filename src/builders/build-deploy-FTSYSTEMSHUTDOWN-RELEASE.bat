REM NOTHING
ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET BATCH_ROOT_MOUNTPOINT_COMMON=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT_COMMON%] == [] SET BATCH_ROOT_MOUNTPOINT_COMMON=%ROOT_MOUNTPOINT_COMMON%

rem ------------------------------------

rem copia i files prodotti nella cartella del setup-source-tree

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\src

SET SETUP_SOURCE_FOLDER=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\artifacts
SET SHUTDOWN_FOLDER=FTSystem.Shutdown\

SET SOLUTION_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\FTSystem.ShutDownPC\FTSystem.ShutDownPC.sln
SET OUTPUT_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\FTSystem.ShutDownPC\Release\x86

ECHO Sto generando la build in RELEASE del pacchetto FTSystem.Shutdown
ECHO percorso di MSBUILD: %PATH_MSBUILD%

"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SOLUTION_FOLDER%"

"%PATH_MSBUILD%" "%SOLUTION_FOLDER%" /target:Clean,Rebuild /p:OutDir="%OUTPUT_FOLDER%";Configuration=Release;Platform=x86 

if not exist "%SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%" mkdir "%SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%"

ECHO Rimuovo files dal percorso %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%
DEL %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%\*.* /Q

ECHO Sto copiando i files nella destinazione: %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%

REM elenco delle DLL da copiare in DEPENDENCIES

COPY %OUTPUT_FOLDER%\config.xml %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%\config.xml.installation
COPY %OUTPUT_FOLDER%\FTSystem.ShutDownLib.dll %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.ShutDownLib.pdb %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.ShutDownPC.exe %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.ShutDownPC.exe.config %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.ShutDownPC.pdb %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%
COPY %OUTPUT_FOLDER%\startMonitor.bat %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%
COPY %OUTPUT_FOLDER%\nlog.dll %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%
COPY %OUTPUT_FOLDER%\nlog.config %SETUP_SOURCE_FOLDER%\%SHUTDOWN_FOLDER%\nlog.config.installation

ECHO Operazione completata!