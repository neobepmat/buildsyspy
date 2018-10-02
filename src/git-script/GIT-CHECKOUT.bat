ECHO "Filename:" %0 1>&2

SET LOCAL_BRANCH_TO_CHECKOUT=develop
IF NOT [%BRANCH_TO_CHECKOUT%] == [] SET LOCAL_BRANCH_TO_CHECKOUT=%BRANCH_TO_CHECKOUT%

rem ------------------------------------------------------------------------

SET GIT_EXE=C:\Program Files (x86)\Git\cmd\git.exe
set DRIVE_GIT_ROOT=C:
set GIT-ROOT-COMMON=c:\git-common

%DRIVE_GIT_ROOT%
cd /

echo Starting Git Checkout...

echo ---------------------
echo Checking out OVERLORD
echo ---------------------
cd %GIT_ROOT%/Overlord
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%


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