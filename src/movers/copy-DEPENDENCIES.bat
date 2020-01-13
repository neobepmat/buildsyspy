ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=K:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

SET INTERNAL_BATCH_FOLDER=K:\GIT\BuildSystem\bitbucket-ft\src
IF NOT [%BATCH_FOLDER%] == [] SET INTERNAL_BATCH_FOLDER=%BATCH_FOLDER%

REM ------------------------------------------------------------------------

SET DEPENDENCIES_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts\dependencies

SET FTCM_FOLDER=C:\FTSYSTEM\BIN
SET COMVB6_FOLDER=%BATCH_ROOT_MOUNTPOINT%\bitbucket-ft\BuildSystem\artifacts\LibrerieVB6\com_vb6

call %INTERNAL_BATCH_FOLDER%\movers\copy-DEVEXPRESS.bat

rem copy "%FTCM_FOLDER%\epplus.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\ftd2xx" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\ftdadapter.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\ftdxskins.dll" "%DEPENDENCIES_FOLDER%"
rem l'assembly FTSystem.Translations.dll viene copiato insieme ai files RDP
rem copy "%TDK_DEPENDENCIES_FOLDER%\FTSystem.Translations.dll" "%DEPENDENCIES_FOLDER%"
REM LA DIPENDENZA LOG4NET VIENE COPIATA anche nella SUBFOLDER TCPIP
rem copy "%FTCM_FOLDER%\log4net.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\Microsoft.Win32.TaskScheduler.dll" "%DEPENDENCIES_FOLDER%"

REM copy "%FTCM_FOLDER%\Modbus.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\NModbus4.dll" "%DEPENDENCIES_FOLDER%"

copy "%FTCM_FOLDER%\ObjectDumper.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\SmartPcsDll.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\SmartPcsDll.pdb" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\System.ComponentModel.Composition.CodePlex.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\System.ComponentModel.Composition.Registration.CodePlex.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\System.ComponentModel.Composition.Web.Mvc.CodePlex.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\System.Reflection.Context.CodePlex.dll" "%DEPENDENCIES_FOLDER%"
REM copy "%FTCM_FOLDER%\Unme.Common.dll" "%DEPENDENCIES_FOLDER%"
REM copy "%FTCM_FOLDER%\Modbus.Extensions.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\BridgeSmartPcs.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\nlog.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\Microsoft.VisualStudio.QualityTools.UnitTestFramework.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\Stateless.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\Dapper.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\DapperExtensions.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\DapperExtensions.pdb" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\Slapper.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\Slapper.pdb" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\LibUsbHasher.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\LibUsbHasher.pdb" "%DEPENDENCIES_FOLDER%"

REM copia in FTCM_FOLDER i files che non vengono rilasciati da nessuna build (oggetti usati in VB6)
copy "%COMVB6_FOLDER%\Translator.dll" "%FTCM_FOLDER%"

copy "%FTCM_FOLDER%\EntityFramework.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\EntityFramework.SqlServer.dll" "%DEPENDENCIES_FOLDER%"

copy "%FTCM_FOLDER%\Flee.dll" "%DEPENDENCIES_FOLDER%"

copy "%FTCM_FOLDER%\Newtonsoft.Json.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\Newtonsoft.Json.Schema.dll" "%DEPENDENCIES_FOLDER%"

copy "%FTCM_FOLDER%\System.Data.SQLite.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\System.Data.SQLite.EF6.dll" "%DEPENDENCIES_FOLDER%"
copy "%FTCM_FOLDER%\System.Data.SQLite.Linq.dll" "%DEPENDENCIES_FOLDER%"
xcopy "%FTCM_FOLDER%\x86\*" "%DEPENDENCIES_FOLDER%\X86\" /Y /f
xcopy "%FTCM_FOLDER%\x64\*" "%DEPENDENCIES_FOLDER%\X64\" /Y /f

rem copia di Redbus
copy "%FTCM_FOLDER%\Redbus.dll" "%DEPENDENCIES_FOLDER%"