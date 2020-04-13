import logging

def getLog(className):
	logger = logging.getLogger(className)
	logger.setLevel(logging.DEBUG)
	fh = logging.FileHandler('pylog/mylog.log')
	fh.setLevel(logging.DEBUG)
	formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
	fh.setFormatter(formatter)
	logger.addHandler(fh)
	return logger