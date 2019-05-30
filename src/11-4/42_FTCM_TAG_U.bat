REM Imposta il TAG definito in questo file sui repository MASTER della versione 11.10
REM IMPORTANTE: questi script non effettuano alcuna PULL e 
REM debbono essere utilizzati dopo aver eseguito un setup ufficiale con successo

NET USE Z: \\VBOXSRV\C_DRIVE

SET GIT-ROOT=Z:\GIT
set GIT-ROOT-COMMON=Z:\GIT
:: Warning! Always use the slash forward within the version number - the backslash is not allowed
SET TAG=v11/11.4.21.1
:: used to start the task as simulated
SET DEMO=0
SET EXT_LOG_FILE=%GIT-ROOT%\BuildSystem\src\log\GIT-TAG_FTCM_11-4_MASTER.log
SET EXT_LOG_FILE_ERR=%GIT-ROOT%\BuildSystem\src\log\GIT-TAG_FTCM_11-4_MASTER_ERR.log
SET BRANCH_11-4_TO_TAG_INTERNAL=master
SET BRANCH_COMMON_TO_TAG_INTERNAL=master

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-TAG-MASTER-FTCM_11-4.bat"

REM RIMOZIONE MAPPING TEMPORANEO
NET USE Z: /DELETE

PAUSE