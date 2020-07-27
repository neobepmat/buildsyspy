# launcher per test purposes
# from logFactory import logger
import logger.loggerFactory as thisLog
import buildSystemConfiguration
import sys

log = thisLog.getLog(__name__)

thisInterpeter = sys.executable
log.info("Python path: %s", thisInterpeter)
# t = b.BuildSystemConfiguration('config/12-U.ini')
# t.Read_Ini()
# t.print_func()

# print ("--------------------------------------")

t = buildSystemConfiguration.BuildSystemConfiguration('config-build/12-u-r.ini')
# t.Read_Ini()
t.print_func()
