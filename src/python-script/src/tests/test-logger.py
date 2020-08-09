from ..logger import loggerFactory

a = loggerFactory.getLog('pippo', None, False)
a.warn('this is a WARNING log row')
