ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

REM ------------------------------------------------------------------------

SET FTCM_SYS_FOLDER=C:\FTSYSTEM\BIN
SET FOLDER_U1021=U1021
SET FOLDER_C1911=C1911
SET FOLDER_EX700MB=EX700MB

SET TDKDEVICEDRIVER_DESTINATION_FOLDER=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\artifacts\TheDarkKnightDeviceDriver

SET DESTINATION_FOLDER_U1021=%TDKDEVICEDRIVER_DESTINATION_FOLDER%\%FOLDER_U1021%
SET DESTINATION_FOLDER_C1911=%TDKDEVICEDRIVER_DESTINATION_FOLDER%\%FOLDER_C1911%
SET DESTINATION_FOLDER_EX700MB=%TDKDEVICEDRIVER_DESTINATION_FOLDER%\%FOLDER_EX700MB%

MKDIR %DESTINATION_FOLDER_U1021%
MKDIR %DESTINATION_FOLDER_EX700MB%

REM ---------------------------------------DLL dei DEVICE DRIVER di TDK----------------------------------- 

REM --------------------------------------- U1021 ----------------------------------- 
REM RIPULISCE LA DIRECTORY DI DESTINAZIONE THE DARK KNIGHT DEVICE DRIVER per la U1021
DEL /F /Q "%DESTINATION_FOLDER_U1021%\*.*"

COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v1_00SP.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v1_01SP.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v1_02SP.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v1_03SP.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v1_26QCS.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v1_33QCS.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v1_00ExQCS.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_00.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_01.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_02.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_03.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_04.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_05.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_06.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_07.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_08.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_09.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_10.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_11.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_12.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_13.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_14.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_15.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_16.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_17.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_18.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_19.*" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.U1021.v4_20.*" %DESTINATION_FOLDER_U1021%

REM --------------------------------------- C1911 ----------------------------------- 
REM RIPULISCE LA DIRECTORY DI DESTINAZIONE THE DARK KNIGHT DEVICE DRIVER per la C1911
REM DEL /F /Q "%DESTINATION_FOLDER_C1911%\*.*"

COPY "%FTCM_SYS_FOLDER%\FT.CM.HistoricFirmware.dll" %DESTINATION_FOLDER_U1021%
COPY "%FTCM_SYS_FOLDER%\FT.CM.HistoricFirmware.pdb" %DESTINATION_FOLDER_U1021%

REM --------------------------------------- EX700MB ----------------------------------- 
REM RIPULISCE LA DIRECTORY DI DESTINAZIONE THE DARK KNIGHT DEVICE DRIVER per la U1021
DEL /F /Q "%DESTINATION_FOLDER_EX700MB%\*.*"

COPY "%FTCM_SYS_FOLDER%\FT.CM.Plc.EX700MB.v1_00.*" %DESTINATION_FOLDER_EX700MB%