C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\regasm.exe "C:\WINDOWS\system32\FTSystem.Communication.Pvi.ComVisible.dll" /u
pause

copy *.dll c:\windows\system32\
xcopy PVI_3.00.02.3017_Setup c:\temp\pvi_3.00.02.3017_Setup\ /S

C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\regasm.exe /tlb "C:\WINDOWS\system32\FTSystem.Communication.Pvi.ComVisible.dll"
pause

"c:\temp\PVI_3.00.02.3017_Setup\Setups\Automation Net PVI Runtime V3.0.2.exe"