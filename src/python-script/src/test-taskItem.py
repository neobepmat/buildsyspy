# launcher per test purposes
# from logFactory import logger
from logger import loggerFactory as thisLog
from modules.task import taskItem as ti

tLog = thisLog.getLog(__name__, append=False)
tLog.debug(__name__)

mainFolder = 'c:/git/bitbucket-ft/buildsystem/src/python-script/config-build'

filename = mainFolder + '/12-HMI-U-R.ini'

t = ti.TaskItem(filename, 'TASK-FTLIB')
if t.initOk is True:
    t.print_Fields()

# -----------------------------------------------------

t = ti.TaskItem(filename, 'TASK-RDP')
if t.initOk is True:
    t.print_Fields()
