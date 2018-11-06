REM Imposta il TAG definito in questo file sui repository MASTER della versione 11.10
REM IMPORTANTE: questi script non effettuano alcuna PULL e 
REM debbono essere utilizzati dopo aver eseguito un setup ufficiale con successo

SET GIT-ROOT=C:\GIT-11-4
set GIT-ROOT-COMMON=c:\git-common
:: Warning! Always use the slash forward within the version number - the backslash is not allowed
SET TAG=v11/11.4.2.1
:: used to start the task as simulated
SET DEMO=0
SET EXT_LOG_FILE=%GIT-ROOT%\BuildSystem\src\log\GIT-TAG_DDK_11-4_MASTER.log
SET EXT_LOG_FILE_ERR=%GIT-ROOT%\BuildSystem\src\log\GIT-TAG_DDK_-11-4_MASTER_ERR.log
SET BRANCH_TO_TAG_INTERNAL=master

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-TAG-MASTER-DDK.bat"

PAUSE