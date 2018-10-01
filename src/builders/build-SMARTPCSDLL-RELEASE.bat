SET PATH_MSBUILD=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\MsBuild.exe

SET SLN_SMARTPCS=\\vboxsvr\c_drive\git\smartpcsdll\SmartPcsDll.sln

ECHO "Filename:" %0 1>&2

"%PATH_MSBUILD%" "%SLN_SMARTPCS%" /P:CONFIGURATION=Release /T:Clean,Rebuild /P:"PLATFORM=Mixed Platforms"

