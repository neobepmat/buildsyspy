REM Lista dei vari repo con versioni per BuildSystem
SET SCRIPT_UPDATER=git-updater.bat

SET GIT_ROOT=C:\GIT-12
SET BRANCH_TO_CHECKOUT=develop
CALL %SCRIPT_UPDATER% %GIT_ROOT% %BRANCH_TO_CHECKOUT% 

SET GIT_ROOT=C:\GIT-12-beta
SET BRANCH_TO_CHECKOUT=develop
CALL %SCRIPT_UPDATER% %GIT_ROOT% %BRANCH_TO_CHECKOUT% 

PAUSE