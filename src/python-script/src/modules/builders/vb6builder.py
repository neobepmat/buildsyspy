# Generic build script that builds VB6 applications
# 
# INSTRUCTIONS:
#	Update the following project paths:
#		proj		Path to the project file (.vbp)
#		
#		delete any of the lines if not applicable
#
#	Update the paths to the build tools:
#		vb6build	Path to VB6
#
# USAGE:
#       
#     proj = r'path to project (.vbp)'
#
#     vb6build = r'C:\Program Files\Microsoft Visual Studio\VB98\VB6.EXE'
#
#     bld = VB6Builder(vb6build=vb6build)
#     bld.run(proj)
#

import os, shlex, subprocess, re, datetime	
		
class VB6Builder:
	
	def __init__(self, vb6build=None):
		if vb6build==None:
			self.vb6build = r''
		else:
			self.vb6build = vb6build
		
	def build(self, projPath, logPathWithName, outputPath):
		# Ensure vb6build exists
		if not os.path.isfile(self.vb6build):
			raise Exception('VB6.exe not found. path=' + self.vb6build)
			
		try:
			os.remove(logPathWithName)
		except OSError:
			pass

		arg1 = '/make'
		arg2 = '/out'
		arg3 = '/outdir'
		p = subprocess.call([self.vb6build, arg1, projPath, arg2, logPathWithName, arg3, outputPath])
		if p==1: return False	# exit early
		
		# adding the parse of logfile to search specific words like 'success' or similar

		return True
		
	def run(self, proj=None, test=None, nuspec=None):
		summary = '';
		
		# File header	
		start = datetime.datetime.now()
		print( '\n'*5)
		summary += self.log('STARTED BUILD - ' + start.strftime("%Y-%m-%d %H:%M:%S"))

		# Build the project
		if proj is not None:
			buildOk = self.build(proj)
			if not buildOk:
				self.log('BUILD: FAILED', start)
				sys.exit(100)
			summary += self.log('BUILD: SUCCEEDED', start)
		else:
			summary += self.log('BUILD: NOT SPECIFIED')
			
		# Build footer
		stop = datetime.datetime.now()
		diff = stop - start
		summary += self.log('FINISHED BUILD', start)
		
		# Build summary
		print( '\n\n' + '-'*80)
		print( summary)
		print( '-'*80)
		
	def log(self, message, start=None):
		timestamp = ''
		numsecs = ''
		if start is not None:
			split = datetime.datetime.now()
			diff = split - start
			timestamp = split.strftime("%Y-%m-%d %H:%M:%S") + '\t'
			numsecs = ' (' + str(diff.seconds) + ' seconds)'
		msg = timestamp + message + numsecs + '\n\n'
		print( '='*10 + '> ' + msg)
		return msg