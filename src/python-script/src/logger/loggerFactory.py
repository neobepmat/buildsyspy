import logging

internalLogFilename = '../pylog/mylog.log'
internalClassName = 'NullClass'

def getLog(className=None, logFilename=None, logLevel=logging.DEBUG):

    if className is None:
        className = internalClassName

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
