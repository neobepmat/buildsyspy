@echo --------------------->> "%EXT_LOG_FILE%" 2>>1& 
@echo Checking out %CURRENT_REPO% >> "%EXT_LOG_FILE%" 2>>1& 
@echo --------------------->> "%EXT_LOG_FILE%" 2>>1& 
call "%GIT_EXE%" -C %CURRENT_FOLDER% reset --hard >> "%EXT_LOG_FILE%" 2>>1& 
call "%GIT_EXE%" -C %CURRENT_FOLDER% checkout %BRANCH_TO_TAG_INTERNAL% >> "%EXT_LOG_FILE%" 2>>1& 
@ECHO Now Tagging >> "%EXT_LOG_FILE%" 2>>1& 

IF %DEMO% == 1 (
	@ECHO This batch has been run in DEMO - next command is not going to be executed >> "%EXT_LOG_FILE%" 2>>1& 
	@ECHO call "%GIT_EXE%" -C %CURRENT_FOLDER% tag %TAG%  >> "%EXT_LOG_FILE%" 2>>1& 
)

IF %DEMO% == 0 (
	@ECHO call "%GIT_EXE%" -C %CURRENT_FOLDER% tag -a %TAG%  >> "%EXT_LOG_FILE%" 2>>1& 
)