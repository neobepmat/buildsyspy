ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET BATCH_ROOT_MOUNTPOINT_COMMON=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT_COMMON%] == [] SET BATCH_ROOT_MOUNTPOINT_COMMON=%ROOT_MOUNTPOINT_COMMON%

rem ------------------------------------

rem copia i files prodotti nella cartella del setup-source-tree

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\src
SET SETUP_SOURCE_FOLDER=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\artifacts
SET TCP_FOLDER=TCPIP\4.0.0
SET DEPENDENCIES_FOLDER=Dependencies
SET SOLUTION_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\FTSystemCommunicationFramework\Source\FTSystem Communication Framework\FTSystem Communication Framework.sln
SET PROJECT_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\FTSystemCommunicationFramework\Source\FTSystem Communication Framework\FTSystem.Communication.FTCMMessageDispatcher\FTSystem.Communication.FTCMMessageDispatcher.csproj
SET OUTPUT_FOLDER=C:\FTSYSTEM\BIN

ECHO Sto generando la build in RELEASE del pacchetto FTSystem.Communication.FTCMMessageDispatcher
ECHO percorso di MSBUILD: %MSBUILD_FOLDER%

"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SOLUTION_FOLDER%"

"%PATH_MSBUILD%" "%PROJECT_FOLDER%" /target:Clean,Rebuild /property:Configuration=Release /p:OutputPath="%OUTPUT_FOLDER%"  || SET BUILD_ERROR=1

if not exist "%SETUP_SOURCE_FOLDER%\%TCP_FOLDER%" mkdir "%SETUP_SOURCE_FOLDER%\%TCP_FOLDER%"

ECHO Rimuovo files dal percorso %SETUP_SOURCE_FOLDER%\%TCP_FOLDER%
DEL %SETUP_SOURCE_FOLDER%\%TCP_FOLDER%\*.* /Q

rem elenco dei file da copiare come dipendenze di 3 parti
rem FTSystem.Configuration.dll
rem FTSystem.Xml.dll
rem log4net.dll

COPY "%OUTPUT_FOLDER%\FTSystem.Configuration.dll" %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY "%OUTPUT_FOLDER%\FTSystem.Xml.dll" %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
rem COPY "%OUTPUT_FOLDER%\log4net.dll" %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%

rem elenco dei file del progetto da copiare come dipendenze
rem FTSystem.Communication.TcpIp.dll
rem FTSystem.Communication.TcpIp.dll.log4net
rem FTSystem.Communication.TcpIp.pdb

COPY "%OUTPUT_FOLDER%\FTSystem.Communication.TcpIp.dll" %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY "%OUTPUT_FOLDER%\FTSystem.Communication.TcpIp.pdb" %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY "%OUTPUT_FOLDER%\FTSystem.Communication.TcpIp.dll.log4net" %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%


rem elenco dei file del progetto da copiare nella cartella specifica TCPIP perchè assembly COM visible
rem FTSystem.Communication.FTCMMessageDispatcher.dll
rem FTSystem.Communication.FTCMMessageDispatcher.tlb
rem FTSystem.Communication.FTCMMessageDispatcher.pdb

COPY "%OUTPUT_FOLDER%\FTSystem.Communication.FTCMMessageDispatcher.dll" %SETUP_SOURCE_FOLDER%\%TCP_FOLDER%
COPY "%OUTPUT_FOLDER%\FTSystem.Communication.FTCMMessageDispatcher.tlb" %SETUP_SOURCE_FOLDER%\%TCP_FOLDER%
COPY "%OUTPUT_FOLDER%\FTSystem.Communication.FTCMMessageDispatcher.pdb" %SETUP_SOURCE_FOLDER%\%TCP_FOLDER%
COPY "%OUTPUT_FOLDER%\log4net.dll" %SETUP_SOURCE_FOLDER%\%TCP_FOLDER%

ECHO Operazione completata!