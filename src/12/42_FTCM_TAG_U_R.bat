REM Imposta il TAG definito in questo file sui repository MASTER della versione 11.10
REM IMPORTANTE: questi script non effettuano alcuna PULL e 
REM debbono essere utilizzati dopo aver eseguito un setup ufficiale con successo

SET GIT-ROOT=C:\GIT-12
set GIT-ROOT-COMMON=c:\git-common
:: Warning! Always use the slash forward within the version number - the backslash is not allowed
SET TAG=v12/12.1.1
:: used to start the task as simulated
SET DEMO=0
SET EXT_LOG_FILE=%GIT-ROOT%\bitbucket-ft\BuildSystem\src\log\GIT-TAG_FTCM_12_MASTER.log
SET EXT_LOG_FILE_ERR=%GIT-ROOT%\bitbucket-ft\BuildSystem\src\log\GIT-TAG_FTCM_12_MASTER_ERR.log
SET BRANCH_12_TO_TAG_INTERNAL=master
SET BRANCH_COMMON_TO_TAG_INTERNAL=master

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-TAG-MASTER-FTCM_12.bat"

PAUSE