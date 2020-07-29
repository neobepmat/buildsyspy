from logger import loggerFactory

a = loggerFactory.getLog('pippo', None)
a.warn('this is a WARNING log row')
