from logger import loggerFactory

a = loggerFactory.getLog('pippo', 'pralinato.log')
a.warn('this is a WARNING log row')
