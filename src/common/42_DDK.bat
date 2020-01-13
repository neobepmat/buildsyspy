:TEST_TDKBUILDRELEASE_FEATURE

call "%BATCH_FOLDER%\builders\build-TDK-RELEASE.bat" %ROOT_MOUNTPOINT% "%PATH_MSBUILD%" >> %LOG_FILE% 2>> %LOG_FILE_ERR%

:TEST_DEVICEDRIVER

call "%BATCH_FOLDER%\builders\build-DEVICEDRIVER-RELEASE" %ROOT_MOUNTPOINT% %PATH_MSBUILD% %ROOT_MOUNTPOINT_COMMON% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

rem pause

:TEST_COPYFTCMDLL_DEVICEDRIVER_FEATURE

call "%BATCH_FOLDER%\movers\copy-FTCMDLL-DEVICEDRIVER.bat" %ROOT_MOUNTPOINT% >> %LOG_FILE% 2>> %LOG_FILE_ERR%

rem pause

:TEST_SETUP_DEVICEDRIVER_FEATURE

call "%BATCH_FOLDER%\setup\setup-DEVICEDRIVER-RELEASE.bat" %CONFIGURATION% %RILASCIO_UFFICIALE% 0 %DEVICE_DRIVER_VERSION% %PATH_MSBUILD% %ROOT_MOUNTPOINT_COMMON% %WIX_TARGETSPATH% %WIXCA_TARGETSPATH% >> %LOG_FILE% 2>>%LOG_FILE_ERR%
rem pause