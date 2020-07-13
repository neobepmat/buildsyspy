ECHO "Filename:" %0 1>&2

SET LOCAL_BRANCH_TO_CHECKOUT=develop
IF NOT [%BRANCH_TO_CHECKOUT%] == [] SET LOCAL_BRANCH_TO_CHECKOUT=%BRANCH_TO_CHECKOUT%

SET LOCAL_BRANCH_TO_CHECKOUT_COMMON=develop
IF NOT [%BRANCH_TO_CHECKOUT_COMMON%] == [] SET LOCAL_BRANCH_TO_CHECKOUT_COMMON=%BRANCH_TO_CHECKOUT_COMMON%

SET LOCAL-GIT-ROOT=c:\git-12
IF NOT [%GIT-ROOT%] == [] SET LOCAL-GIT-ROOT=%GIT-ROOT%

rem ------------------------------------------------------------------------

@ECHO Working on specific repo:[%BRANCH_TO_CHECKOUT%] on common repo:[%BRANCH_TO_CHECKOUT_COMMON%]

SET GIT_EXE=C:\Program Files\Git\cmd\git.exe
set DRIVE_GIT_ROOT=C:

call "c:\Program Files\Git\cmd\start-ssh-agent.cmd"

%DRIVE_GIT_ROOT%
cd /

echo Starting Git Checkout...

echo ---------------------
echo Checking out OVERLORD
echo ---------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/Overlord12
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%


echo ----------------------------------
echo Checking out ConfiguratoreOverlord
echo ----------------------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/hmiconfig12
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%


echo --------------------------
echo Checking out TheDarkKnight
echo --------------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/tdk12
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%


echo --------------------------
echo Checking out TheDarkKnight DeviceDriver
echo --------------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/ddk12
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT_COMMON%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%


echo --------------------------
echo Checking out TheDarkKnight Setup
echo --------------------------  
cd %LOCAL-GIT-ROOT%/bitbucket-ft/setup-hmi
call "%GIT_EXE%" reset --hard
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT_COMMON%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status  
cd %DRIVE_GIT_ROOT%

echo --------------------------  
echo Checking out TheDarkKnight DeviceDriver Setup
echo --------------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/setup-ddk
call "%GIT_EXE%" reset --hard
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT_COMMON%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

echo --------------------------
echo Checking out FTSystem Shutdown
echo --------------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/ftsystem.ShutDownPC
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT_COMMON%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

echo --------------------------
echo Checking out RDP
echo --------------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/ftsystem.RDP
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT_COMMON%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

echo --------------------------
echo Checking out UWFLib
echo --------------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/uwflib
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT_COMMON%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

echo --------------------------
echo Checking out TheDarkKnightCommunicationFramework
echo --------------------------
cd %LOCAL-GIT-ROOT%/bitbucket-ft/tdkcommunicationframework
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT_COMMON%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

cd /