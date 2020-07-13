REM ----------------------------------------------------------------
SET VERSIONE=1.0.0.0
REM ----------------------------------------------------------------

REM Imposta il TAG definito in questo file sui repository MASTER della versione 11.10
REM IMPORTANTE: questi script non effettuano alcuna PULL e 
REM debbono essere utilizzati dopo aver eseguito un setup ufficiale con successo

SET GIT-ROOT=C:\GIT-12
set GIT-ROOT-COMMON=c:\GIT-12
SET TAG_FTCM=v12/%VERSIONE%
SET TAG_BUILDSYSTEM=Ftcm12/%VERSIONE%

REM used to start the task as simulated
SET DEMO=0
SET EXT_LOG_FILE=%GIT-ROOT%\bitbucket-ft\BuildSystem\src\log\GIT-TAG_FTCM_12_MASTER.log
SET EXT_LOG_FILE_ERR=%GIT-ROOT%\bitbucket-ft\BuildSystem\src\log\GIT-TAG_FTCM_12_MASTER_ERR.log

SET BRANCH_12_TO_TAG_INTERNAL=master
SET BRANCH_COMMON_TO_TAG_INTERNAL=master

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-TAG-MASTER-FTCM_12.bat"

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-TAG-MASTER-BUILDSYSTEM.bat"

PAUSE