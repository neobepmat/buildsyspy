SET LOCAL_BRANCH_TO_CHECKOUT=develop
IF NOT [%BRANCH_TO_CHECKOUT%] == [] SET LOCAL_BRANCH_TO_CHECKOUT=%BRANCH_TO_CHECKOUT%

rem ------------------------------------------------------------------------

SET GIT_EXE=C:\Program Files (x86)\SmartGit\git\bin\git.exe
set DRIVE_GIT_ROOT=C:
set GIT-ROOT-COMMON=c:\git-common
set GIT_SOURCETREE=%GIT_ROOT%\FT10-Setup-SourceTree
set LOCAL_BRANCH_TO_CHECKOUT=master
set LOG_GIT=%GIT_SOURCETREE%\batch\git_log.txt
set LOG_GIT_ERR=%GIT_SOURCETREE%\batch\git_error_log.txt

%DRIVE_GIT_ROOT%
cd /

@echo Starting Git Checkout... > %LOG_GIT% 2> %LOG_GIT_ERR%
@echo >> %LOG_GIT% 2>> %LOG_GIT_ERR%


@echo ---------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out OVERLORD  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo ---------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT_ROOT%/Overlord >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%


@echo ----------------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out ConfiguratoreOverlord  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo ----------------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT_ROOT%/ConfiguratoreOverlord >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%


@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out TheDarkKnight  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT_ROOT%/TheDarkKnight  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%


@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out TheDarkKnight DeviceDriver  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT-ROOT-COMMON%/TheDarkKnightDeviceDriver  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%


@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out TheDarkKnight Setup  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT-ROOT-COMMON%/FT10-Setup  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%

@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out TheDarkKnight DeviceDriver Setup  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT-ROOT-COMMON%/FT10Setup-TDKDeviceDriver  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%

@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out FTSystem Shutdown  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT-ROOT-COMMON%/FTSystem.ShutDownPC  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%

@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out RDP  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT-ROOT-COMMON%/FTSystem.RDP  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%

@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out FTSystem Communication Framework  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT-ROOT-COMMON%/FTSystemCommunicationFramework  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%

@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo Checking out UWFLib  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
@echo --------------------------  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %GIT-ROOT-COMMON%/UWFLib.git  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" checkout %LOCAL_BRANCH_TO_CHECKOUT% >> %LOG_GIT% 2>> %LOG_GIT_ERR%
call "%GIT_EXE%" status  >> %LOG_GIT% 2>> %LOG_GIT_ERR%
cd %DRIVE_GIT_ROOT%

cd /