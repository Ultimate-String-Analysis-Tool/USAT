# Building from the Source Code
## Table of Contents
* [Building on Linux](#linux)
* [Building on Windows](#windows)


## Linux
USAT can be built Linux devices with CMake, Make, and GCC, and is tested with such a configuration.
Below are the necessary commands to do so:
```bash
cd repository-directory # Change "repository-directory" to the root directory of a local, offline copy of this repository.
cmake .                 # CMake generates build scripts that Make can interpret.
make -j8                # Run the build scripts to compile a standalone application. "-j#" builds # files simultaneously.
```

The root of this repository contains a [shell script](build.sh) that attempts to update the repository with Git, 
generates Makefiles with CMake, builds the source code with GCC and Make, and updates CMake, Make, and GCC with *apt* if 
that package manager is available on your system.

Every trace of building the project can be removed with the [deep-clean](deep-clean.sh) shell script. Use it carefully!

## Windows
USAT is recognized by Visual Studio as a CMake project, allowing it to be built on Visual Studio without extensions. 
It can also be built with the C++ tools and CMake extensions for VS Code.

The root of this repository contains a [batch tool](build.bat) that attempts to update the repository with Git and builds 
USAT if Visual Studio is installed, or if Visual Studio Code is installed with the CMake and C++ Tools extensions.

Every trace of building the project can be removed with the [deep-clean](deep-clean.bat) batch tool. Use it carefully!
