REM ----------------------------------------------------------------
SET VERSIONE=1.6.0.0
REM ----------------------------------------------------------------

REM Imposta il TAG definito in questo file sui repository MASTER della versione 11.10
REM IMPORTANTE: questi script non effettuano alcuna PULL e 
REM debbono essere utilizzati dopo aver eseguito un setup ufficiale con successo

SET GIT-ROOT=C:\GIT-12
set GIT-ROOT-COMMON=c:\git-12
SET TAG_DDK=v12/%VERSIONE%
SET TAG_BUILDSYSTEM=Ddk12/%VERSIONE%

SET DEMO=0 
SET EXT_LOG_FILE=%GIT-ROOT%\bitbucket-ft\BuildSystem\src\log\GIT-TAG_DDK_12_MASTER.log
SET EXT_LOG_FILE_ERR=%GIT-ROOT%\bitbucket-ft\BuildSystem\src\log\GIT-TAG_DDK_12_MASTER_ERR.log
SET BRANCH_TO_TAG_INTERNAL=master

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-TAG-MASTER-DDK.bat"

CALL "%GIT-ROOT%\bitbucket-ft\BuildSystem\src\git-script\GIT-TAG-MASTER-BUILDSYSTEM.bat"

PAUSE