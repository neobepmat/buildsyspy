ECHO "Filename:" %0 1>&2

SET LOCAL_BRANCH_TO_CHECKOUT=develop
IF NOT [%BRANCH_TO_CHECKOUT%] == [] SET LOCAL_BRANCH_TO_CHECKOUT=%BRANCH_TO_CHECKOUT%

SET GIT_ROOT_INTERNAL=C:\GIT-11-4
IF NOT [%GIT_ROOT%] == [] SET GIT_ROOT_INTERNAL=%GIT_ROOT%

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
cd %GIT_ROOT_INTERNAL%/BuildSystem
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status
cd %DRIVE_GIT_ROOT%

cd /

PAUSE