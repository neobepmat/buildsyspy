# launcher per test purposes
# from logFactory import logger
from logger import loggerFactory as thisLog
from modules.task import taskConfig as tc

tLog = thisLog.getLog(__name__, append=False)
tLog.debug(__name__)

mainFolder = 'c:/git/bitbucket-ft/buildsystem/src/python-script/config-task'

filename = mainFolder + '/rdp-cleanRebuild-X86-Release.ini'

t = tc.TaskConfig(filename)
if t.initOk is True:
    t.print_Fields()

# -----------------------------------------------------

t = tc.TaskConfig(filename)
if t.initOk is True:
    t.print_Fields()
