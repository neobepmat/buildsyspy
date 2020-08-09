# launcher per test purposes
# from logFactory import logger
from logger import loggerFactory as thisLog
import buildSystemConfiguration
import sys

log = thisLog.getLog(__name__)

thisInterpeter = sys.executable
log.info("Python path: %s", thisInterpeter)
# t = b.BuildSystemConfiguration('config/12-U.ini')
# t.Read_Ini()
# t.print_func()

# print ("--------------------------------------")

mainFolder = 'c:/git/bitbucket-ft/buildsystem/src/python-script/config-build'
filename = mainFolder + '/12-HMI-U-R.ini'

t = buildSystemConfiguration.BuildSystemConfiguration(filename)
# t.Read_Ini()
t.print_func()
