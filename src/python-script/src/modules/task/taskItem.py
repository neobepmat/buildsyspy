import configparser
from logger import loggerFactory as thisLog
from os import path

class TaskItem():

    # True if initialization is successful
    initOk = False
    section = None
    path = None

    def __init__(self, filename, section):
        self.log = thisLog.getLog(__name__)

        if path.exists(filename) is False:
            self.log.debug('Cannot find the file ' + filename)
            self.initOk = False
            return None

        self.initOk = True
        self.section = section

        self.filename = filename
        self.__initFields

        self.log.debug("File exists:" + str(path.exists(filename)))

        result = self.__readFields(self.filename, section)
        if result is False:
            self.log.error('Error while reading fields for file [%s]', self.filename)

    def __initFields(self):
        if self.initOk is False:
            return None

        self.enabled = None
        self.path = None
        self.target = []

    def __readFields(self, filename, section):
        if self.initOk is False:
            return None

        config = configparser.ConfigParser()
        self.log.debug('reading ini file [%s]', filename)
        config.read(filename)

        self.enabled = config[section]['ENABLED']
        self.path = config[section]['PATH']
        target = config[section]['TARGET']
        self.target = target.split()
        return True

    def print_Fields(self):
        if self.initOk is False:
            return None

        tmpStr = "-------------------------------------------------------------"
        tmpStr += "-- Tasklist Fields for file {0} - section {1} \n".format(self.filename, self.section)
        tmpStr += "------------------------------------------------------------" + '\n'
        tmpStr += "Enabled={0} \n".format(self.enabled)
        tmpStr += "Path={0} \n".format(self.path)
        tmpStr += "Target={0} \n".format(self.target)
        tmpStr += "------------------------------------------------------------"
        print(tmpStr)
        self.log.debug(tmpStr)
