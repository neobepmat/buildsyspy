SET MSG_NEW_TAG=new version

@echo --------------------->> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
@echo Checking out %CURRENT_REPO% >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
@echo --------------------->> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
call "%GIT_EXE%" -C %CURRENT_FOLDER% reset --hard >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
call "%GIT_EXE%" -C %CURRENT_FOLDER% checkout %BRANCH_TO_TAG_INTERNAL% >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
@ECHO Now Tagging >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"

IF %DEMO% == 1 (
	@ECHO This batch has been run in DEMO - next command is not going to be executed >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
	@ECHO call "%GIT_EXE%" -C %CURRENT_FOLDER% tag -a %TAG% -m "%MSG_NEW_TAG%"  >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
)

IF %DEMO% == 0 (
	@ECHO Creating Tag [%TAG%] for repository [%CURRENT_REPO%] branch [%BRANCH_TO_TAG_INTERNAL%] >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
	call "%GIT_EXE%" -C %CURRENT_FOLDER% tag -a %TAG% -m "%MSG_NEW_TAG%"  >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
	call "%GIT_EXE%" -C %CURRENT_FOLDER% push origin %TAG%  >> "%EXT_LOG_FILE%" 2>>"%EXT_LOG_FILE_ERR%"
)