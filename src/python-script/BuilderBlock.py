import configparser
import loggerFactory

class BuilderBlock():
	
	def __init__(self, filename):
		self.filename = filename
		self.__initFields
		self.log = loggerFactory.getLog(__name__)
		
		result = self.__readFields(self.filename)
		if result == False:
			self.log.error('Error while reading fields for file [%s]', self.filename)

	def __initFields():
		self.description = undefined
		self.solution = undefined
		self.target = []
		self.platform = undefined
		self.configuration = undefined

	def __readFields(filename):
		config = configparser.ConfigParser()
		log.debug('reading ini file [%s]',filename)
		config.read(filename)

		self.description = config['DEFAULT']['DESCRIPITION']		
		self.solution = config['DEFAULT']['SOLUTION']		
		target = config['DEFAULT']['TARGET']
		self.target = split(target)
		self.platform = config['DEFAULT']['PLATFORM']
		self.configuration = config['DEFAULT']['CONFIGURATION']
		return True

	def print_Fields():
		tmpStr = "-----------------------------"
		tmpStr += ("-- Fields for file [%s]" % self.filename)
		tmpStr += "-----------------------------"
		tmpStr += "-----------------------------"
		tmpStr += "Description=" + self.description
		tmpStr += "Solution=" + self.solution
		tmpStr += "Target=" + self.target
		tmpStr += "Platform=" + self.platform
		tmpStr += "Configuration=" + self.configuration
