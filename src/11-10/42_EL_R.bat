REM NOTHING
ECHO "Filename:" %0 1>&2
SET EL_VERSIONE=1.0.0.0
REM -------------------------------------

SET BATCH_ROOT_MOUNTPOINT=C:\git-11-10
SET BATCH_ROOT_MOUNTPOINT_COMMON=C:\git-common
rem -------------------------------------------

SET BATCH_FOLDER_VERSIONE=%BATCH_ROOT_MOUNTPOINT%\BuildSystem

SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\MSBUILD.EXE
SET WIX_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.targets
SET WIXCA_TARGETSPATH=C:\Program Files (x86)\MSBuild\Microsoft\WiX\v3.x\wix.ca.targets

SET SOLUTION_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\ExternalLogin\ExternalLogin.sln
SET SETUP_PROJECT=%BATCH_ROOT_MOUNTPOINT_COMMON%\ExternalLogin\Setup\ExternalLoginSetup\ExternalLoginSetup.wixproj
SET OUTPUT_FOLDER=C:\FTSYSTEM\BIN
SET MSI_OUTPUT_FOLDER=%BATCH_ROOT_MOUNTPOINT_COMMON%\ExternalLogin\Setup\ExternalLoginSetup\bin\Release

SET OUTPUT_PATH=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\src\msi-output\SETUPFT10-EXTERNALLOGIN

ECHO Sto generando la build in RELEASE del pacchetto ExternalLogin (costruisce e copia in ftsystem/bin tutti gli assembly sviluppati)
ECHO percorso di MSBUILD: %PATH_MSBUILD%

ECHO Sto cancellando tutti i files presenti nella cartella %MSI_OUTPUT_FOLDER%
DEL /Q "%MSI_OUTPUT_FOLDER%\*.*"

MKDIR "%OUTPUT_PATH%"

ECHO Sto effettuando la pull del repository in Git

SET GIT_EXE=C:\Program Files (x86)\Git\cmd\git.exe
set DRIVE_GIT_ROOT=C:
set GIT-ROOT-COMMON=c:\git-common

echo Starting Git Checkout...

echo ---------------------
echo Checking out EXTERNALLOGIN solution...
echo ---------------------
%DRIVE_GIT_ROOT%
cd "%GIT-ROOT-COMMON%\ExternalLogin"
call "%GIT_EXE%" checkout master
call "%GIT_EXE%" pull
call "%GIT_EXE%" status

ECHO Sto effettuando il restore dei pacchetti Nuget

"%BATCH_FOLDER_VERSIONE%\src\bin\nuget.exe" restore "%SOLUTION_FOLDER%"

ECHO Sto eseguendo i target Clean e Rebuild della soluzione

"%PATH_MSBUILD%" "%SOLUTION_FOLDER%" /target:Clean,Rebuild /property:Configuration=Release /p:Platform=x86 /p:OutputPath="%OUTPUT_FOLDER%"

ECHO Sto costruendo il nuovo setup di ExternalLogin

"%PATH_MSBUILD%" "%SETUP_PROJECT%" /P:CONFIGURATION=Release /T:Clean,Build /P:PLATFORM=x86 /p:EXTERNALLOGIN_VERSION="%EL_VERSIONE%"

COPY "%MSI_OUTPUT_FOLDER%\*.*" "%OUTPUT_PATH%"

ECHO Operazione completata!

PAUSE