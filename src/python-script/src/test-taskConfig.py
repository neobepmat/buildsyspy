# launcher per test purposes
# from logFactory import logger
from logger import loggerFactory as thisLog
from modules.task import taskConfig as tf

tLog = thisLog.getLog(__name__)

mainFolder = 'c:/git/bitbucket-ft/buildsystem/src/python-script/src/config-task'

# filename = './config-task/rdp-cleanRebuild-X86-Release.ini'
filename = mainFolder + '/rdp-cleanRebuild-X86-Release.ini'


t = tf.TaskConfig(filename)
if t.initOk is True:
    t.print_Fields()

# -----------------------------------------------------

filename = mainFolder + '/ftlibservice-cleanRebuild-X86-Release.ini'

t = tf.TaskConfig(filename)
if t.initOk is True:
    t.print_Fields()

# -----------------------------------------------------

filename = mainFolder + '/ftsystemshutdown-cleanRebuild-X86-Release.ini'

t = tf.TaskConfig(filename)
if t.initOk is True:
    t.print_Fields()
