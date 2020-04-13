# coding=utf-8
import os, shlex, subprocess, re, datetime
import configparser
import loggerFactory

class BuildSystemConfiguration:

	def __init__(self, iniFileName):
		self.iniFileName = iniFileName
		self.log = loggerFactory.getLog(__name__)
		self.__loadConfiguration(iniFileName)

	def __loadConfiguration(self, iniFileName):
		retBool = self.__doIniExists(iniFileName)

		if retBool == False:
			self.log.error("Error in ", __name__)
			exit(main())

		self.__read_versionIni(iniFileName)

		retBool = self.__doIniExists(self.configIni)
		if retBool == False:
			self.log.error("Error in ", __name__)
			exit(main())

		self.__read_configIni(self.configIni)

		retBool = self.__doIniExists(self.localIni)
		if retBool == False:
			self.log.error("Error in ", __name__)
			exit(main())

		self.__read_localIni(self.localIni)

	def __doIniExists(self, iniFileName):
		self.log.debug("Trying to open filename[" + iniFileName +"]")
		self.fileEsiste = os.path.exists(iniFileName)
		if self.fileEsiste == False:
			self.log.debug("-----------------------------------------------")
			self.log.debug("FILE " + str(iniFileName) + " NOT FOUND!")
			self.log.debug("-----------------------------------------------")
			return false

	def __read_configIni(self, iniFileName):
		config = configparser.ConfigParser()
		config.read(iniFileName)

		self.main_Target = config['TARGET']['MAIN_TARGET']
		self.rilascio = int(config['TARGET']['RILASCIO_UFFICIALE'])

		main_paths = config['MAIN_PATHS']
		self.rootMountPoint = main_paths['ROOT_MOUNTPOINT']
		self.rootFolder = 'undefined'
		self.rootMountPointCommon= main_paths['ROOT_MOUNTPOINT_COMMON']
		self.batchFolder= 'undefined'
		self.rootSourceFolder = main_paths['ROOT_SOURCE_FOLDER']
		
		self.commonIni = config['COMMON_FILE']['COMMON_INI']
		self.localIni = config['LOCAL_FILE']['LOCAL_INI']

		self.__setRilascioUfficiale(self.rilascio)

		self.__setVersione(self.versione, self.versioneWithText)

		self.__setCommonFolders()

		self.__setOverlord()

	def __read_versionIni(self, iniFileName):
		config = configparser.ConfigParser()
		config.read(iniFileName)
		
		self.versionIni = iniFileName
		self.latestRunDate = config['DEFAULT']['LATEST_RUN_DATE']
		self.versione = config['DEFAULT']['VERSIONE']
		self.versioneWithText = config['DEFAULT']['VERSIONE_WITH_TEXT']
		self.versioneWithText = self.versione + self.versioneWithText
		self.configIni = config['CONFIG_FILE']['PATH']

	def __setVersione(self, version, extended_text):
		self.versione = version
		self.version_with_text = version + extended_text

	def __setRilascioUfficiale(self, rilascio):
		if rilascio == 1:
			self.rilascioUfficiale = True
			self.rilascioNonUfficiale = False
		if rilascio == 0:
			self.rilascioUfficiale = False
			self.rilascioNonUfficiale = True

	def __setOverlord(self):
		self.projectPathOVERLORD = self.rootSourceFolder + '\\OVERLORD\\FTControlsManager.vbp'
		self.projectPathCONFIGURATORE = self.rootSourceFolder + '\\CONFIGURATOREOVERLORD\\FTControlsManagerConfigurator.vbp'
		return;

	def __setCommonFolders(self):
		self.rootFolder = self.rootMountPoint + '\\BuildSystem'
		self.batchFolder = self.rootFolder + '\\src'

	def __read_localIni(self, iniFileName):
		config = configparser.ConfigParser()
		config.read(iniFileName)

		self.pathMsbuild = config['MSBUILD']['MSBUILD_FULL_PATH']
		
		self.wixTargetsPath = config['MSBUILD_WIX_PATHS']['WIX_TARGETSPATH']
		self.wixcaTargetsPath = config['MSBUILD_WIX_PATHS']['WIXCA_TARGETSPATH']
		
		self.nugetPath = config['NUGET']['NUGET_FULL_PATH']

	def print_func(self):
		print ("-----------------------------------------------")
		print ("Configurazione Build --------------------------")
		print ("-----------------------------------------------")
		print ("Version File:[%s]" % self.versionIni)
		print ("-----------------------------------------------")

		print ("Latest RunDate:" , self.latestRunDate)
		print ("Versione:" , self.versione)
		print ("Versione con testo:" , self.versioneWithText)

		print ("-----------------------------------------------")
		print ("Config File:[%s]" % self.configIni)
		print ("-----------------------------------------------")

		print ("Main Target=", self.main_Target)

		if self.rilascioUfficiale:
			print ("Rilascio Ufficiale:" , self.rilascioUfficiale)
		else:
			print ("Rilascio Non Ufficiale:" , self.rilascioNonUfficiale)		
		
		print ("Root Mount point:", self.rootMountPoint)
		print ("Root Mount Point Common:", self.rootMountPointCommon)
		print ("Root Source Folder: ", self.rootFolder)
		print ("Batch Folder:" , self.batchFolder)
		print ("-----------------------------------------------")

		print ("Project Path Overlord:", self.projectPathOVERLORD)
		print ("Project Path Configuratore:", self.projectPathCONFIGURATORE)

		print ("-----------------------------------------------")
		print ("Local File:[%s]" % self.localIni)
		print ("-----------------------------------------------")

		print ("MsBuild Full Path:", self.pathMsbuild)
		print ("Wix Targets Path:" , self.wixTargetsPath)
		print ("WixCa Targets Path:" , self.wixcaTargetsPath)
		print ("Nuget Path:" , self.nugetPath)