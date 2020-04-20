# launcher per test purposes
# from logFactory import logger
import logger.loggerFactory as thisLog
import task.taskConfig as tf

tLog = thisLog.getLog(__name__)

filename = 'taskconfig/rdp-cleanRebuild-X86-Release.ini'

t = tf.TaskConfig(filename)
# t.Read_Ini()
t.print_Fields()

# -----------------------------------------------------

filename = 'taskconfig/ftlibservice-cleanRebuild-X86-Release.ini'

t = tf.TaskConfig(filename)
# t.Read_Ini()
t.print_Fields()

# -----------------------------------------------------

filename = 'taskconfig/ftsystemshutdown-cleanRebuild-X86-Release.ini'

t = tf.TaskConfig(filename)
# t.Read_Ini()
t.print_Fields()