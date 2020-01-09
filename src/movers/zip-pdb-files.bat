ECHO "Filename:" %0 1>&2
SET SETUP_VERSIONE=1.1.1.1
SET INTERNO_RILASCIO_UFFICIALE=1
SET INTERNO_ZIP_FILENAME=FTCM_PDB_NO_VERSION.zip
SET INTERNO_EXE_PDB_FOLDER=*.BAT
SET INTERNO_FTCM_PDB_FOLDER=*.CMD

IF NOT [%VERSIONE%] == [] SET SETUP_VERSIONE=%VERSIONE%
IF NOT [%RILASCIO_UFFICIALE%] == [] SET INTERNO_RILASCIO_UFFICIALE=%RILASCIO_UFFICIALE%
IF NOT [%ZIP_FILENAME%] == [] SET INTERNO_ZIP_FILENAME=%ZIP_FILENAME%
IF NOT [%EXE_PDB_FOLDER%] == [] SET INTERNO_EXE_PDB_FOLDER=%EXE_PDB_FOLDER%
IF NOT [%FTCM_PDB_FOLDER%] == [] SET INTERNO_FTCM_PDB_FOLDER=%FTCM_PDB_FOLDER%

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

REM --------------------------------------

SET PATH_ZIP_UTIL=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src\bin\zip.exe
SET PATH_ZIP_NEWARCHIVE=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\src\msi-output\SETUPFT10

"%PATH_ZIP_UTIL%" "%PATH_ZIP_NEWARCHIVE%\%INTERNO_ZIP_FILENAME%" "%INTERNO_FTCM_PDB_FOLDER%" "%INTERNO_EXE_PDB_FOLDER%" 

REM PAUSE