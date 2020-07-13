@ECHO "Filename:" %0 1>&2

SET LOCAL_BRANCH_TO_CHECKOUT=develop
IF NOT [%BRANCH_TO_CHECKOUT%] == [] SET LOCAL_BRANCH_TO_CHECKOUT=%BRANCH_TO_CHECKOUT%

rem ------------------------------------------------------------------------

@echo Starting Git Checkout...

@echo ---------------------
@echo Checking out BuildSystem for %GIT_ROOT%
@echo ---------------------
call "%GIT_EXE%" -C %GIT_FOLDER% checkout %LOCAL_BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" -C %GIT_FOLDER% pull
call "%GIT_EXE%" -C %GIT_FOLDER% status