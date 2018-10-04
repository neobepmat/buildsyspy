ECHO "Filename:" %0 1>&2

SET BRANCH_TO_TAG_INTERNAL=master

IF [%TAG%] == [] (
	@ECHO No Tag has been supplied - process interrupted.
	PAUSE
	EXIT
) 

rem ------------------------------------------------------------------------

@ECHO Applying Tag [%TAG%] to [master] branch for all involeved repositories. Continue?
CHOICE /C CH /M Select [Y] Yes or [N] No
IF errorlevel 2 goto sub_hard
IF errorlevel 1 goto sub_cd


SET GIT_EXE=C:\Program Files (x86)\Git\cmd\git.exe
set DRIVE_GIT_ROOT=C:
set GIT-ROOT-COMMON=c:\git-common

echo Starting Git Checkout...

echo ---------------------
echo Checking out OVERLORD
echo ---------------------
call "%GIT_EXE%" -C %GIT_ROOT%\Overlord checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" -C %GIT_ROOT%\Overlord tag %LOCAL_BRANCH_TO_CHECKOUT%

rem git tag -a v1.4 -m "my version 1.4"

echo ----------------------------------
echo Checking out ConfiguratoreOverlord
echo ----------------------------------
cd %GIT_ROOT%/ConfiguratoreOverlord
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%


echo --------------------------
echo Checking out TheDarkKnight
echo --------------------------
cd %GIT_ROOT%/TheDarkKnight
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%


echo --------------------------
echo Checking out TheDarkKnight DeviceDriver
echo --------------------------
cd %GIT-ROOT-COMMON%/TheDarkKnightDeviceDriver
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%


echo --------------------------
echo Checking out TheDarkKnight Setup
echo --------------------------  
cd %GIT-ROOT-COMMON%/FT10-Setup  
call "%GIT_EXE%" reset --hard
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status  
cd %DRIVE_GIT_ROOT%

echo --------------------------  
echo Checking out TheDarkKnight DeviceDriver Setup
echo --------------------------
cd %GIT-ROOT-COMMON%/FT10Setup-TDKDeviceDriver
call "%GIT_EXE%" reset --hard
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

echo --------------------------
echo Checking out FTSystem Shutdown
echo --------------------------
cd %GIT-ROOT-COMMON%/FTSystem.ShutDownPC
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

echo --------------------------
echo Checking out RDP
echo --------------------------
cd %GIT-ROOT-COMMON%/FTSystem.RDP
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

echo -------------------------
echo Checking out FTSystem Communication Framework
echo --------------------------
cd %GIT-ROOT-COMMON%/FTSystemCommunicationFramework
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

echo --------------------------
echo Checking out UWFLib
echo --------------------------
cd %GIT-ROOT-COMMON%/UWFLib.git
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

cd /