import logging
import os

dirname = os.path.dirname(__file__)
internalLogFilename = os.path.join(dirname, '../../pylog/mylog.log')

internalClassName = 'NullClass'

def getLog(className=None, logFilename=None, append=True):

    if className is None:
        className = internalClassName

    if append is not True:
        if os.path.exists(internalLogFilename):
            os.remove(internalLogFilename)

    logger = logging.getLogger(className)
    logger.setLevel(logging.DEBUG)

    if logFilename is None:
        logFilename = internalLogFilename

    fh = logging.FileHandler(logFilename)
    fh.setLevel(logging.DEBUG)
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    fh.setFormatter(formatter)
    logger.addHandler(fh)
    return logger
