# coding=utf-8
import os, shlex, subprocess, re, datetime
import ConfigParser

class BuildSystemConfiguration:

	def __init__(self, iniFileName):
		self.iniFileName = iniFileName
		self.doCheckIniExists()

		if self.fileEsiste:
			self.InternalParameters()
	
	def doCheckIniExists(self):
		self.fileEsiste = os.path.exists(self.iniFileName)
		if self.fileEsiste == False:
			print ("-----------------------------------------------")
			print("FILE " + str(self.iniFileName) + " NOT FOUND!")
			print ("-----------------------------------------------")

	def InternalParameters(self):
		config = ConfigParser.ConfigParser()
		config.read(self.iniFileName)
		self.rootMountPoint = config.get('MAIN_PATHS','ROOT_MOUNTPOINT','undefined')
		self.rootFolder = 'undefined'
		self.rootMountPointCommon= config.get('MAIN_PATHS','ROOT_MOUNTPOINT_COMMON','undefined')
		self.batchFolder= 'undefined'
		self.rootSourceFolder = config.get('MAIN_PATHS','ROOT_SOURCE_FOLDER','undefined')

	def Read_Ini(self):
		if self.fileEsiste:
			config = ConfigParser.ConfigParser()
			config.read(self.iniFileName)
			
			self.versione = config.get('DEFAULT','VERSIONE','11')
			self.versioneWithText = config.get('DEFAULT','VERSIONE_WITH_TEXT','-undefined')
			self.versioneWithText = self.versione + self.versioneWithText

			self.rilascio = config.getint('TARGET','RILASCIO_UFFICIALE')

			self.main_Target = config.get('TARGET','MAIN_TARGET', 'Undefined')

			self.setRilascioUfficiale(self.rilascio)

			self.setVersione(self.versione, self.versioneWithText)

			self.setCommonFolders()

			self.setOverlord()

			self.setMsbuildPaths(self.iniFileName)

	def setVersione(self, version, extended_text):
		self.versione = version
		self.version_with_text = version + extended_text

	def setRilascioUfficiale(self, rilascio):
		if rilascio == 1:
			self.rilascioUfficiale = True
			self.rilascioNonUfficiale = False
		if rilascio == 0:
			self.rilascioUfficiale = False
			self.rilascioNonUfficiale = True

	def setOverlord(self):
		self.projectPathOVERLORD = self.rootSourceFolder + '\\OVERLORD\\FTControlsManager.vbp'
		self.projectPathCONFIGURATORE = self.rootSourceFolder + '\\CONFIGURATOREOVERLORD\\FTControlsManagerConfigurator.vbp'
		return;

	def setCommonFolders(self):
		self.rootFolder = self.rootMountPoint + '\\BuildSystem'
		self.batchFolder = self.rootFolder + '\\src'

	def setMsbuildPaths(self, iniFileName):
		config = ConfigParser.ConfigParser()
		config.read(iniFileName)

		msBuildPathsFilename = config.get('MSBUILD_FILE','MSBUILD_FILE_NAME')

		config = ConfigParser.ConfigParser()
		config.read(msBuildPathsFilename)

		self.pathMsbuild = config.get('MSBUILD_WIX_PATHS','PATH_MSBUILD', 'undefined')
		self.wixTargetsPath = config.get('MSBUILD_WIX_PATHS','WIX_TARGETSPATH', 'undefined')
		self.wixcaTargetsPath = config.get('MSBUILD_WIX_PATHS','WIXCA_TARGETSPATH', 'undefined')


	def print_func(self):
		if self.fileEsiste:
			print ("-----------------------------------------------")
			print ("Configurazione Build --------------------------")
			print ("-----------------------------------------------")

			print ("Versione:" , self.versione)
			print ("Versione con testo:" , self.versioneWithText)

			if self.rilascioUfficiale:
				print ("Rilascio Ufficiale:" , self.rilascioUfficiale)
			else:
				print ("Rilascio Non Ufficiale:" , self.rilascioNonUfficiale)

			print ("Main Target=", self.main_Target)
			print ("-----------------------------------------------")

			print ("Root Mount point:", self.rootMountPoint)
			print ("Root Folder: ", self.rootFolder)
			print ("Root Mount Point Common:", self.rootMountPointCommon)
			print ("Batch Folder:" , self.batchFolder)
			print ("-----------------------------------------------")

			print ("Project Path Overlord:", self.projectPathOVERLORD)
			print ("Project Path Configuratore:", self.projectPathCONFIGURATORE)
			print ("-----------------------------------------------")

			print ("Path MsBuild:", self.pathMsbuild)
			print ("Wix Targets Path:" , self.wixTargetsPath)
			print ("WixCa Targets Path:" , self.wixcaTargetsPath)