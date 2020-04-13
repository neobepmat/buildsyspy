# launcher per test purposes
# from logFactory import logger
import loggerFactory
import buildSystemConfiguration as b
import sys

logger = loggerFactory.getLog(__name__)

thisInterpeter = sys.executable
logger.info("Python path: %s", thisInterpeter)
# t = b.BuildSystemConfiguration('config/12-U.ini')
# t.Read_Ini()
# t.print_func()

# print ("--------------------------------------")

t = b.BuildSystemConfiguration('versions/12-U-Version.ini')
# t.Read_Ini()
t.print_func()