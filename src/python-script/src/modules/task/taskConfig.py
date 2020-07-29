import configparser
from logger import loggerFactory as thisLog
from os import path

class TaskConfig():

    # True if initialization is successful
    initOk = False

    def __init__(self, filename):
        self.log = thisLog.getLog(__name__)

        if path.exists(filename) is False:
            self.log.debug('Cannot find the file ' + filename)
            self.initOk = False
            return None

        self.initOk = True

        self.filename = filename
        self.__initFields

        self.log.debug("File exists:" + str(path.exists(filename)))

        result = self.__readFields(self.filename)
        if result is False:
            self.log.error('Error while reading fields for file [%s]', self.filename)

    def __initFields(self):
        if self.initOk is False:
            return None

        self.description = None
        self.solution = None
        self.target = []
        self.platform = None
        self.configuration = None

    def __readFields(self, filename):
        if self.initOk is False:
            return None

        config = configparser.ConfigParser()
        self.log.debug('reading ini file [%s]', filename)
        config.read(filename)

        self.description = config['DEFAULT']['DESCRIPTION']
        self.solution = config['DEFAULT']['SOLUTION']
        target = config['DEFAULT']['TARGET']
        self.target = target.split()
        self.platform = config['DEFAULT']['PLATFORM']
        self.configuration = config['DEFAULT']['CONFIGURATION']
        return True

    def print_Fields(self):
        if self.initOk is False:
            return None

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
