ECHO "Filename:" %0 1>&2

SET BATCH_ROOT_MOUNTPOINT=Z:\GIT
IF NOT [%ROOT_MOUNTPOINT%] == [] SET BATCH_ROOT_MOUNTPOINT=%ROOT_MOUNTPOINT%

REM ------------------------------------------------------------------------

SET DEVEXPRESS_FOLDER=C:\Program Files (x86)\DevExpress 17.1\Components\Bin\Framework
SET DEPENDENCIES_FOLDER=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\artifacts\dependencies

SET FTCM_FOLDER=C:\FTSYSTEM\BIN
SET COMVB6_FOLDER=%BATCH_ROOT_MOUNTPOINT%\BuildSystem\artifacts\LibrerieVB6\com_vb6

XCOPY /S /I "%DEVEXPRESS_FOLDER%\de" "%DEPENDENCIES_FOLDER%\de" /Y
XCOPY /S /I "%DEVEXPRESS_FOLDER%\ru" "%DEPENDENCIES_FOLDER%\ru" /Y
XCOPY /S /I "%DEVEXPRESS_FOLDER%\ja" "%DEPENDENCIES_FOLDER%\ja" /Y
XCOPY /S /I "%DEVEXPRESS_FOLDER%\es" "%DEPENDENCIES_FOLDER%\es" /Y

copy "%DEVEXPRESS_FOLDER%\DevExpress.Charts.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.CodeParser.v17.1.dll" "%DEPENDENCIES_FOLDER%"	
copy "%DEVEXPRESS_FOLDER%\DevExpress.Data.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.DataAccess.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.DataAccess.v17.1.UI.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Diagram.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Images.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Office.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Pdf.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.PivotGrid.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Printing.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.RichEdit.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.RichEdit.v17.1.Export.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Sparkline.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Spreadsheet.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Utils.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Utils.v17.1.UI.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.Xpo.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraBars.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraCharts.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraCharts.v17.1.Extensions.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraCharts.v17.1.UI.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraCharts.v17.1.Wizard.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraDiagram.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraEditors.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraGauges.v17.1.Core.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraGauges.v17.1.Win.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraGrid.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraLayout.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraNavBar.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraPivotGrid.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraPrinting.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraReports.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraReports.v17.1.Extensions.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraRichEdit.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraSpreadsheet.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraTreeList.v17.1.dll" "%DEPENDENCIES_FOLDER%"
copy "%DEVEXPRESS_FOLDER%\DevExpress.XtraVerticalGrid.v17.1.dll" "%DEPENDENCIES_FOLDER%"

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

copy "%FTCM_FOLDER%\redbus.dll" "%DEPENDENCIES_FOLDER%"
xcopy "%FTCM_FOLDER%\x86\*" "%DEPENDENCIES_FOLDER%\X86\" /Y /f
xcopy "%FTCM_FOLDER%\x64\*" "%DEPENDENCIES_FOLDER%\X64\" /Y /f