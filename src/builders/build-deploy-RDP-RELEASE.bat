ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET BATCH_ROOT_MOUNTPOINT_COMMON=K:\GIT
IF NOT [%ROOT_MOUNTPOINT_COMMON%] == [] SET BATCH_ROOT_MOUNTPOINT_COMMON=%ROOT_MOUNTPOINT_COMMON%

rem -------------------------------------------

rem copia i files prodotti nella cartella del setup-source-tree

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src
SET SETUP_SOURCE_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts
SET RDP_FOLDER=RDP\2.0.0
SET DEPENDENCIES_FOLDER=Dependencies
SET SOLUTION_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\bitbucket-ft\FTSystem.RDP\FTSystem.RDP.sln
SET OUTPUT_FOLDER=C:\FTSYSTEM\BIN

ECHO Sto generando la build in RELEASE del pacchetto FTSystem.RDP.Executable
ECHO percorso di MSBUILD: %PATH_MSBUILD%

ECHO Sto effettuando il restore dei pacchetti Nuget

"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SOLUTION_FOLDER%" -ConfigFile "%BATCH_FOLDER_VERSIONE%\bin\%NUGET-FILENAME%"

IF NOT %ERRORLEVEL% == 0 (
	SET BUILD_ERROR= 1
	EXIT /B
)

ECHO Sto eseguendo i target Clean e Rebuild della soluzione

"%PATH_MSBUILD%" "%SOLUTION_FOLDER%" /target:Clean,Rebuild /property:Configuration=Release /p:Platform=x86  /p:OutputPath="%OUTPUT_FOLDER%" || SET BUILD_ERROR=1

if not exist "%SETUP_SOURCE_FOLDER%\%RDP_FOLDER%" mkdir "%SETUP_SOURCE_FOLDER%\%RDP_FOLDER%"

ECHO Rimuovo files dal percorso %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
DEL %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%\*.* /Q
FOR /d %%x in (%SETUP_SOURCE_FOLDER%\%RDP_FOLDER%\*) do @rd /s /q "%%x"

ECHO Sto copiando i files nella destinazione: %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%

rem config file for VNC and RDP
XCOPY %OUTPUT_FOLDER%\Configuration\config.json %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%\Configuration\
XCOPY %OUTPUT_FOLDER%\RDPSetup\RDPTemplate.rdp %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%\RDPSetup\

rem default shortcut for RDPExecutable.exe with several values for MODE parameter
XCOPY "%OUTPUT_FOLDER%\FT.RemoteDesktop.Executable.Shortcuts\FT.RemoteDesktop.Executable.exe - Shortcut RDP.lnk" "%SETUP_SOURCE_FOLDER%\%RDP_FOLDER%\FT.RemoteDesktop.Executable.Shortcuts\"
XCOPY "%OUTPUT_FOLDER%\FT.RemoteDesktop.Executable.Shortcuts\FT.RemoteDesktop.Executable.exe - Shortcut DEFAULT RDP.lnk" "%SETUP_SOURCE_FOLDER%\%RDP_FOLDER%\FT.RemoteDesktop.Executable.Shortcuts\"
XCOPY "%OUTPUT_FOLDER%\FT.RemoteDesktop.Executable.Shortcuts\FT.RemoteDesktop.Executable.exe - Shortcut STUB.lnk" "%SETUP_SOURCE_FOLDER%\%RDP_FOLDER%\FT.RemoteDesktop.Executable.Shortcuts\"

COPY %OUTPUT_FOLDER%\AxInterop.MSTSCLib.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.Executable.exe %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.Executable.exe %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.Executable.exe %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.Executable.pdb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.MsRdp.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.MsRdp.pdb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.MsTsc.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.MsTsc.pdb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.pdb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.Starter.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.Starter.pdb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.TightVnc.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FT.RemoteDesktop.TightVnc.pdb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.FTOsk.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%

COPY %OUTPUT_FOLDER%\FTSystem.RDP.COMVisible.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.COMVisible.pdb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.COMVisible.tlb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%

COPY %OUTPUT_FOLDER%\FTSystem.SystemIO.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.Translations.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.Translations.xml %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.Validators.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.VirtualInput.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\ICSharpCode.SharpZipLib.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\Interop.MSTSCLib.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
rem do not copy NewtonSoft, this library is already suppplied by TDK12
rem COPY %OUTPUT_FOLDER%\Newtonsoft.Json.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
rem COPY %OUTPUT_FOLDER%\Newtonsoft.Json.xml %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
rem do not copy NLog, this library is already suppplied by TDK12
rem COPY %OUTPUT_FOLDER%\NLog.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\RemoteCore.Common.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\RemoteCore.Viewer.Common.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\RemoteCore.Viewer.Core.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\RemoteCore.Viewer.WinForms.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\TabControlEX.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%

ECHO Operazione completata!