# Structure of Buildsystem Python scripts

This file contains how the directory structure of Python scripts has been designed

All hereunder information are topic related to the folder **python-script** of the main Buildsystem structure.

## Log

The directory **logger** contains script to provide logging features to the buildsystem.

Log are saved in **pylog** folder

## Builders

The directory **builders** includes the main script for several type of build type used in the Buildsystem.

For this release the builders supported are:

- **Msbuild**
- **Visual Basic 6**

## Configuration

There are several directories involved in the configuration of the Buildsystem.

- config-common, where common configuration files are stored (e.g. paths for local or remote location of MSBuild tools)
- config-build, where specific build configuration files are stored (e.g. HMI or DDK)
- config-task, where specific task configuration are stored (e.g FTSystem.RDP)

## Versions

The folder **versions** stores the configuration file which retain the version number for every possibile configuration
