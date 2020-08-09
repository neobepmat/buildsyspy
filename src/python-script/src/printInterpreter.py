import sys
import os
from logger import loggerFactory

print(sys.executable)


dir_path = os.path.dirname(os.path.realpath(__file__))
print(dir_path)

cwd = os.getcwd()
print(cwd)

log = loggerFactory.getLog('stillo', 'krakatoa.log')
log.debug('questo debug vale oro')
