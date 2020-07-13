REM Lista dei vari repo con versioni per BuildSystem
SET SCRIPT_UPDATER=git-updater.bat

SET GIT_EXE=C:\Program Files\Git\cmd\git.exe

SET GIT_ROOT=C:\GIT-12
SET GIT_FOLDER=%GIT_ROOT%/bitbucket-ft/BuildSystem
SET BRANCH_TO_CHECKOUT=develop
CALL %SCRIPT_UPDATER% %GIT_ROOT% %BRANCH_TO_CHECKOUT% 

SET GIT_ROOT=C:\GIT-12-beta
SET GIT_FOLDER=%GIT_ROOT%/bitbucket-ft/BuildSystem
SET BRANCH_TO_CHECKOUT=develop
CALL %SCRIPT_UPDATER% %GIT_ROOT% %BRANCH_TO_CHECKOUT% 

PAUSE