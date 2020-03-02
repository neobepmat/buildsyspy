REM Imposta il TAG definito in questo file sui repository MASTER della versione 11.10
REM IMPORTANTE: questi script non effettuano alcuna PULL e 
REM debbono essere utilizzati dopo aver eseguito un setup ufficiale con successo

SET TEMP_DRIVE_LETTER=K:
NET USE %TEMP_DRIVE_LETTER% \\VBOXSRV\C_DRIVE

SET GIT-ROOT=K:\GIT
set GIT-ROOT-COMMON=k:\GIT
:: Warning! Alays use the slash forward within the version number - the backslash is not allowed
SET TAG=v12/1.2.0.0
:: used to start the task as simulated
SET DEMO=0 
SET EXT_LOG_FILE=%GIT-ROOT%\bitbucket-ft\BuildSystem\src\log\GIT-TAG_DDK_12_MASTER.log
SET EXT_LOG_FILE_ERR=%GIT-ROOT%\bitbucket-ft\BuildSystem\src\log\GIT-TAG_DDK_12_MASTER_ERR.log
SET BRANCH_TO_TAG_INTERNAL=master

CALL "%GIT-ROOT%\BuildSystem\src\git-script\GIT-TAG-MASTER-DDK.bat"

REM RIMOZIONE MAPPING TEMPORANEO
NET USE %TEMP_DRIVE_LETTER% /DELETE

PAUSE