ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET BATCH_ROOT_MOUNTPOINT_COMMON=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT_COMMON%] == [] SET BATCH_ROOT_MOUNTPOINT_COMMON=%ROOT_MOUNTPOINT_COMMON%

rem -------------------------------------------

rem copia i files prodotti nella cartella del setup-source-tree

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\src
SET SETUP_SOURCE_FOLDER=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\artifacts
SET RDP_FOLDER=RDP\2.0.0
SET DEPENDENCIES_FOLDER=Dependencies
SET SOLUTION_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\FTSystem.RDP\FTSystem.RDP.sln
SET OUTPUT_FOLDER=C:\FTSYSTEM\BIN

ECHO Sto generando la build in RELEASE del pacchetto FTSystem.RDP.Executable
ECHO percorso di MSBUILD: %PATH_MSBUILD%

ECHO Sto effettuando il restore dei pacchetti Nuget

"%BATCH_FOLDER_VERSIONE%\bin\nuget.exe" restore "%SOLUTION_FOLDER%"

ECHO Sto eseguendo i target Clean e Rebuild della soluzione

"%PATH_MSBUILD%" "%SOLUTION_FOLDER%" /target:Clean,Rebuild /property:Configuration=Release /p:Platform=x86  || SET BUILD_ERROR=1

if not exist "%SETUP_SOURCE_FOLDER%\%RDP_FOLDER%" mkdir "%SETUP_SOURCE_FOLDER%\%RDP_FOLDER%"

ECHO Rimuovo files dal percorso %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
DEL %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%\*.* /Q

ECHO Sto copiando i files nella destinazione: %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%

REM elenco delle DLL da copiare in DEPENDENCIES ed in RDP
REM teniamo in RDP gli assembly che sono da registrare come COM

rem del progetto RDP in DEPENDENCIES ---------
rem FTSystem.RDP.dll
rem FTSystem.RDP.Executable
rem FTSystem.RDP.MSTSC
rem FTSystem.RDP.Starter

COPY %OUTPUT_FOLDER%\FTSystem.RDP.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.Executable.exe %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.Executable.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.Executable.exe.config %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.Executable.exe.log4net %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.MSTSC.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.MSTSC.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.Starter.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.VirtualInput.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.VirtualInput.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.FTOsk.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.FTOsk.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%

rem dipendenze di 3 parti in DEPENDENCIES ----
rem AxInterop.MSTSCLib.dll
rem Interop.MSTSCLib.dll
rem FTSystem.dll e pdb
rem FTSystem.SystemIO.dll e pdb
rem FTSystem.Translations.dll e pdb
rem FTSystem.Validators.dll e pdb
rem FTSystem.WinForms.Controls.dll e pdb
rem FTSystem.WinForms.dll e pdb
rem ICSharpCode.NRefactory.dll
rem ICSharpCode.SharpDevelop.Dom.dll
rem ICSharpCode.SharpZipLib.dll
rem ICSharpCode.TextEditor.dll
rem log4net.dll nella versione 1.2.10 del .NET Framework 2.0 (per motivi legati alla Modbus.dll)
rem TabControlEX

COPY %OUTPUT_FOLDER%\AxInterop.MSTSCLib.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\Interop.MSTSCLib.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.SystemIO.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.SystemIO.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.Translations.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.Translations.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.Validators.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.Validators.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.WinForms.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.WinForms.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.WinForms.Controls.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.WinForms.Controls.pdb %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\ICSharpCode.NRefactory.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\ICSharpCode.SharpDevelop.Dom.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\ICSharpCode.SharpZipLib.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\ICSharpCode.TextEditor.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
rem log4net viene copiato dal folder del TCPIP
rem COPY %OUTPUT_FOLDER%\log4net.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%
COPY %OUTPUT_FOLDER%\TabControlEX.dll %SETUP_SOURCE_FOLDER%\%DEPENDENCIES_FOLDER%

rem in RDP da registrare come REGASM ------------------
rem FTSystem.RDP.COMVisible

COPY %OUTPUT_FOLDER%\FTSystem.RDP.COMVisible.dll %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.COMVisible.pdb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%
COPY %OUTPUT_FOLDER%\FTSystem.RDP.COMVisible.tlb %SETUP_SOURCE_FOLDER%\%RDP_FOLDER%

ECHO Operazione completata!