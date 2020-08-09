import sys, os
from PyQt4 import QtGui, QtCore, uic
from PyQt4.QtGui import QMessageBox

from main import *
from builder_configuration import BuilderConfiguration

form_class = uic.loadUiType("../python-UI/main.ui")[0]                 # Load the UI

class MyException(Exception):
    pass

class MyWindowClass(QtGui.QMainWindow, form_class):   
    
    def __init__(self, parent=None):
        QtGui.QMainWindow.__init__(self, parent)
        self.setupUi(self)
        self.btnStart.clicked.connect(self.validate_builder)
        self.isOfficialVersion = False
        self.versionNumber = None
        
        self.doBuildTdkDesign = False
        self.doBuildOverlord = False
        self.doBuildConfiguratore = False
        self.doBuildTdk = False
        self.doBuildTdkDeviceDriver = False

        self.doTdkSetup = False
        self.doTdkDeviceDriverSetup = False
        
        self.doBuildTdk_Debug = False
        self.doBuildTdkDeviceDriver_Debug = False

        self.configurator = BuilderConfiguration()

    def getOfficialVersionType(self):
        if self.chkOfficialVersion.isChecked():
            self.isOfficialVersion = True
        else:
            self.isOfficialVersion = False

    def getOperationsList(self):
        if self.chkBuildTdkDesign.isChecked():
            self.doBuildTdkDesign = True
        else:
            self.doBuildTdkDesign = False        
        
        if self.chkBuildOverlord.isChecked():
            if not self.doBuildTdkDesign:
                self.chkBuildTdkDesign.toggle()
            self.doBuildTdkDesign = True
            self.doBuildOverlord = True
        else:
            self.doBuildOverlord = False

        if self.chkBuildConfiguratore.isChecked():
            if not self.doBuildTdkDesign:
                self.chkBuildTdkDesign.toggle()
            self.doBuildTdkDesign = True

            self.doBuildConfiguratore = True
        else:
            self.doBuildConfiguratore = False

        if self.chkBuildTdk.isChecked():
            self.doBuildTdk = True
        else:
            self.doBuildTdk = False

        if self.chkBuildTdkDeviceDriver.isChecked():
            self.doBuildTdkDeviceDriver = True
        else:
            self.doBuildTdkDeviceDriver = False

        if self.chkDoTdkSetup.isChecked():
            self.doTdkSetup = True
        else:
            self.doTdkSetup = False

        if self.chkDoTdkDeviceDriverSetup.isChecked():
            self.doTdkDeviceDriverSetup = True
        else:
            self.doTdkDeviceDriverSetup = False
            
        if self.chkDoBuildTdk_Debug.isChecked():
            self.doBuildTdk_Debug = True
        else:
            self.doBuildTdk_Debug = False

        if self.chkDoBuildTdkDeviceDriver_Debug.isChecked():
            self.doBuildTdkDeviceDriver_Debug = True
        else:
            self.doBuildTdkDeviceDriver_Debug = False

    def checkDirectoriesExistence(self, FTCMfolderToBeChecked, TDKfolderToBeChecked):
        try:
            if not os.path.exists(FTCMfolderToBeChecked):
                print('Directory %s does not exist. It will be created.'% (FTCMfolderToBeChecked))
                os.makedirs(FTCMfolderToBeChecked)
                print('Directory %s has been created.'% (FTCMfolderToBeChecked))
    
            if not os.path.exists(TDKfolderToBeChecked):
                print('Directory %s does not exist. It will be created.'% (TDKfolderToBeChecked))
                os.makedirs(TDKfolderToBeChecked)
                print('Directory %s has been created.'% (TDKfolderToBeChecked))
    
            return True
        
        except MyException as e:
            QMessageBox. about(self, "CheckDirectoryExistence - Exception", str(e))
            return False

    def resumeOperations(self):
        
        if not self.edtVersion.text():
            raise MyException('Version number not specified!')

        if self.isOfficialVersion:
            FTCMfolderToBeChecked = self.configurator.OfficialExePath + "\\" + self.edtVersion.text()
            TDKfolderToBeChecked = self.configurator.OfficialTdkPath + "\\" + self.edtVersion.text()
        else:
            FTCMfolderToBeChecked = self.configurator.NonOfficialExePath + "\\" + self.edtVersion.text()
            TDKfolderToBeChecked = self.configurator.NonOfficialTdkPath + "\\" + self.edtVersion.text()
        
        if not self.checkDirectoriesExistence(FTCMfolderToBeChecked, TDKfolderToBeChecked):
            raise MyException('Error while creating folders for FTCM and TDK versions!')
        
        self.versionNumber = self.edtVersion.text()

        operationsLog = ""

        self.getOfficialVersionType()
        
        self.getOperationsList()

        if self.isOfficialVersion:
            operationsLog += 'Building an OFFICIAL VERSION of OVERLORD, version number is ['+ self.versionNumber +']\n\n'
        else:
            operationsLog += 'Building a NON_OFFICIAL VERSION of OVERLORD, version number is ['+ self.versionNumber +']!\n\n'

        if self.doBuildTdkDesign:
            operationsLog += "Building TDK in DESIGN: YES\n\n"
        else:
            operationsLog += "Building TDKin DESIGN: NO\n\n"            
            
        if self.doBuildOverlord:
            operationsLog += "Building OVERLORD: YES\n"
        else:
            operationsLog += "Building OVERLORD: NO\n"

        if self.doBuildConfiguratore:
            operationsLog += "Building CONFIGURATORE OVERLORD: YES\n\n"
        else:
            operationsLog += "Building CONFIGURATORE OVERLORD: NO\n\n"

        if self.doBuildTdk:
            operationsLog += "Building TDK: YES\n"
        else:
            operationsLog += "Building TDK: NO\n"

        if self.doBuildTdk_Debug:
            operationsLog += "Building TDK in DEBUG: YES\n\n"
        else:
            operationsLog += "Building TDK in DEBUG: NO\n\n"

        if self.doBuildTdkDeviceDriver:
            operationsLog += "Building TDK DEVICE DRIVER: YES\n"
        else:
            operationsLog += "Building TDK DEVICE DRIVER: NO\n"

        if self.doBuildTdkDeviceDriver_Debug:
            operationsLog += "Building TDK DEVICE DRIVER in DEBUG: YES\n\n"
        else:
            operationsLog += "Building TDK DEVICE DRIVER in DEBUG: NO\n\n"

        if self.doTdkSetup:
            operationsLog += "Building OVERLORD SETUP: YES\n\n"
        else:
            operationsLog += "Building OVERLORD SETUP: NO\n\n"

        if self.doTdkDeviceDriverSetup:
            operationsLog += "Building TDK DEVICE DRIVER SETUP: YES\n\n"
        else:
            operationsLog += "Building TDK DEVICE DRIVER SETUP: NO\n\n"

        operationsLog += "Would you like to continue using these parameters?"

        print(operationsLog)

        #QMessageBox.about(self, "List of Operations", operationsLog)
        reply = QMessageBox.question(self, "List of Operations", operationsLog, QtGui.QMessageBox.Yes, QtGui.QMessageBox.No)

        if reply == QtGui.QMessageBox.Yes:
            return True
        else:
            return False

    def validate_builder(self):
        try:
            reply = self.resumeOperations()
            if reply:
                print("Operations will be executed")
                
                self.mainBuilder = MainBuilder(
                    self.isOfficialVersion,
                    self.doBuildTdkDesign, 
                    self.doBuildOverlord, 
                    self.doBuildConfiguratore,
                    self.doBuildTdk, 
                    self.doBuildTdkDeviceDriver, 
                    self.doTdkSetup, 
                    self.doTdkDeviceDriverSetup,
                    self.versionNumber,
                    self.doBuildTdk_Debug,
                    self.doBuildTdkDeviceDriver_Debug)       
                
#                 self, doOfficial, doOverlord, 
#                     doConfiguratore, doTdk, doTdkDeviceDriver, 
#                     doTdkSetup, doTdkDeviceDriverSetup, versionNumber,
#                     doTdk_Debug, doTdkDeviceDriver_Debug                         
                
                self.main_workflow()
            else:
                print("Operation has been stopped by the operator!")

        except MyException as e:
            QMessageBox.about(self, "List of Operations - Exception", str(e))

            return False

    def launch_vb6(self):
        self.mainBuilder.buildVb6()
        pass
    
    def launch_tdk_design(self):
        self.mainBuilder.buildTdkDesign()
        pass
    
    def launch_tdk_full(self):
        self.mainBuilder.buildTdkFinal()
        pass
    
    def launch_tdkdevicedriver(self):
        self.mainBuilder.buildTdkDeviceDriver()
        pass
    
    def launch_tdk_setup(self):
        self.mainBuilder.buildTdkSetup()
        pass
    
    def launch_tdkdevicedriver_setup(self):
        pass
    
    def main_workflow(self):
        self.launch_tdk_design()
        
        self.launch_vb6()
        
        self.launch_tdk_full()
        
        self.launch_tdkdevicedriver()
        
        self.launch_tdk_setup()
        
        self.launch_tdkdevicedriver_setup()
        
        QMessageBox.about(self, "List of Operations", "Operations have been finished!")
        
        pass

app = QtGui.QApplication(sys.argv)
myWindow = MyWindowClass(None)
myWindow.show()
app.exec_()
