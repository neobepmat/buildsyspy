REM Lista dei vari repo con versioni per BuildSystem

SET BUILDSYSTEM_FOLDER=c:\git\buildsystem
SET GIT_EXE=C:\Program Files\Git\cmd\git.exe
SET BRANCH_TO_CHECKOUT=develop
SET GIT_RUNNER=%BUILDSYSTEM_FOLDER%/src/git-runner/git-runner.bat

cd %BUILDSYSTEM_FOLDER%

call "%GIT_EXE%" checkout %BRANCH_TO_CHECKOUT%
call "%GIT_EXE%" pull
call "%GIT_EXE%" status

call %GIT_RUNNER%

PAUSE