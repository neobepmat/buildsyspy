from vb6builder import VB6Builder
from stampver import StampVer
from builder_configuration import BuilderConfiguration
from msbuilder import MsBuilder
import os, shutil

class MainBuilder:
	def __init__(self, doOfficial, doTdkDesign, doOverlord, 
				doConfiguratore, doTdk, doTdkDeviceDriver, 
				doTdkSetup, doTdkDeviceDriverSetup, versionNumber,
				doTdk_Debug, doTdkDeviceDriver_Debug):
		
		self.configurator = BuilderConfiguration()

		self.configurator.DoOfficialVersion = doOfficial

		self.configurator.TDK_DoBuildDesign = doTdkDesign

		self.configurator.Overlord_DoBuild = doOverlord
		self.configurator.Configuratore_DoBuild = doConfiguratore
		self.configurator.newVersionFTCM = versionNumber
		self.configurator.newVersionConfig = versionNumber

		self.configurator.TDK_DoBuild = doTdk
		self.configurator.TDK_DeviceDriver_DoBuild = doTdkDeviceDriver
		
		self.configurator.TDKSetup_DoBuild = doTdkSetup
		self.configurator.TDKDeviceDriverSetup_DoBuild = doTdkDeviceDriverSetup
		
		self.doTdk_Debug = doTdk_Debug
		self.doTdkDeviceDriver_Debug = doTdkDeviceDriver_Debug

	def buildVb6(self):
		buildvb6 = VB6Builder(self.configurator.vb6Path)
		if self.configurator.Overlord_DoBuild:
			print('Building FTControlsManager...')
			buildvb6.build(self.configurator.projPathFTCM, self.configurator.logPathWithNameFTCM, self.configurator.outputPathFTCM)

		if self.configurator.Configuratore_DoBuild:
			print('Building FTControlsManagerConfiguratore...')
			buildvb6.build(self.configurator.projPathCONFIG, self.configurator.logPathWithNameCONFIG, self.configurator.outputPathCONFIG)

	def buildTdkFinal(self):
		if self.configurator.TDK_DoBuild:
			if self.configurator.TDK_DoDebug:
				msconfiguration = 'Debug'
			else:
				msconfiguration = 'Release'
			mstarget = r'Clean,Rebuild'
			msplatform = r'x86'
				
			print('Building TheDarkKnight: configuration=[%s] [%s], Clean and Rebuild \n', msconfiguration, mstarget)
			buildMsbuild = MsBuilder(self.configurator.msbuildPath, msconfiguration, mstarget, msplatform)
			buildMsbuild.build()
			print('Building TheDarkKnight: configuration=Final, finished.\n')

	def buildTdkDesign(self):
		if self.configurator.TDK_DoBuildDesign:
			print('Building TheDarkKnight: configuration=Design, Clean and Rebuild \n')
			msconfiguration = 'Design'
			mstarget = r'Clean,Rebuild' 
			msplatform = r'x86' 
			buildMsbuild = MsBuilder(self.configurator.msbuildPath, msconfiguration, mstarget, msplatform)
			buildMsbuild.build(self.configurator.projPathTDK)
			print('Building TheDarkKnight finished.\n')

	def buildTdkDeviceDriver(self):
		if self.configurator.TDKDeviceDriver_DoBuild:
			if self.configurator.TDKDeviceDriver_DoDebug:
				target = 'Debug'
			else:
				target = 'Release'
				
			print('Building TheDarkKnight: configuration=Final [%s], Clean and Rebuild \n', target)
			buildMsbuild = MsBuilder(self.configurator.msbuildPath, target, 'Clean,Rebuild')
			buildMsbuild.build(self.configurator.projPathTDK)
			print('Building TheDarkKnight: configuration=Final, finished.\n')

	def stampingFiles(self, newVersion):
		stampVer = StampVer()
		ftcm_exe = self.configurator.ftcm_exe
		stampVer.execute(ftcm_exe, newVersion)
		print ("Stamping " + ftcm_exe + " [" + newVersion + "]...")
		ftcmConfiguratore_exe = self.configurator.ftcmConfiguratore_exe
		stampVer.execute(ftcmConfiguratore_exe, newVersion)
		print ("Stamping "+ ftcmConfiguratore_exe +" [" + newVersion + "]...")
		print ('End of stamping operations')
		
	def deleteEverythingInFtcmSystemFolder(self):
		result = True		
		for the_file in os.listdir(self.configurator.FTCMSystemPath):
		    file_path = os.path.join(folder, the_file)
		    try:
		        if os.path.isfile(file_path):
		            os.unlink(file_path)
		            
		    except Exception as e:
		        print(e)
		        result = False
	    
		if result:
			print("All files and folder in [" + self.configurator.FTCMSystemPath +"] have been successfully deleted.")
			
		return result
		
	def buildTdkSetup(self):
	    pass

	def buildTdkDevicedriverSetup(self):
		pass