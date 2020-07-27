import sys
import configparser
sys.path.insert(0, '../logger')
import logger.loggerFactory as thisLog

class TaskConfig():
	
	def __init__(self, filename):
		self.filename = filename
		self.__initFields
		self.log = thisLog.getLog(__name__)
		
		result = self.__readFields(self.filename)
		if result == False:
			self.log.error('Error while reading fields for file [%s]', self.filename)

	def __initFields():
		self.description = undefined
		self.solution = undefined
		self.target = []
		self.platform = undefined
		self.configuration = undefined

	def __readFields(self, filename):
		config = configparser.ConfigParser()
		self.log.debug('reading ini file [%s]',filename)
		config.read(filename)

		self.description = config['DEFAULT']['DESCRIPTION']		
		self.solution = config['DEFAULT']['SOLUTION']		
		target = config['DEFAULT']['TARGET']
		self.target = target.split()
		self.platform = config['DEFAULT']['PLATFORM']
		self.configuration = config['DEFAULT']['CONFIGURATION']
		return True

	def print_Fields(self):
		tmpStr = "-------------------------------------------------------------"
		tmpStr += ("-- Fields for file [%s]" % self.filename) + '\n'
		tmpStr += "------------------------------------------------------------" + '\n'
		tmpStr += "Description=" + self.description + '\n'
		tmpStr += "Solution=" + self.solution + '\n'
		tmpStr += "Target=" + '-'.join(self.target) + '\n'
		tmpStr += "Platform=" + self.platform + '\n'
		tmpStr += "Configuration=" + self.configuration + '\n'
		tmpStr += "------------------------------------------------------------"
		print(tmpStr)
		self.log.debug(tmpStr)
