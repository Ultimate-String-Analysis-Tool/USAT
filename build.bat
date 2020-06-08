@echo off

Rem try to update the Git repository if possible
where /q git
IF ERRORLEVEL 1 (
    ECHO Couldn't find Git. Will not update.
) ELSE (
    ECHO Attempting to update to the latest version...
    git fetch
    git pull
    IF ERRORLEVEL 1 (
        ECHO  Update failed.
    ) ELSE (
        ECHO Update successful!
    )
    echo Updating submodules...
    IF ERRORLEVEL 1 (
        ECHO Submodule update failed! The project may not work as expected because it's working on multiple or non-standard versions.
    ) ELSE (
        ECHO Submodule update was successful!
    )
)

Rem check if CMake exists on this machine. 
Rem If it doesn't, this project cannot be built.
where /q cmake
IF ERRORLEVEL 1 (
    ECHO CMake is missing. Ensure it is installed and placed in your PATH.
    ECHO Official CMake downloads can be found at https://cmake.org/download/
    ECHO Or if you have Chocolatey, run 'choco install cmake'
    ECHO Aborting
	pause
    EXIT /B
) ELSE (
    ECHO CMake found. Bulding
)

Rem Generate the build scripts
if %PROCESSOR_ARCHITECTURE%==x86 (
	rem 32 bit
	echo 32 bit machine detected.
	cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -H. -Bbuild -T host=x86 -A x86
	IF ERRORLEVEL 1 (
		ECHO The build failed on initialization! 
		ECHO Please place a comment on the Github issue that addresses the problem, and we'll try to fix it in a timely manner.
		ECHO If no such Github issue exists, please submit a new issue containing the output of this script.
		pause
		EXIT /B
	)
) else (
	rem 64 bit
	echo 64 bit machine detected.
  	cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -H. -Bbuild -T host=x64 -A x64
	IF ERRORLEVEL 1 (
		ECHO The build failed on initialization! 
		ECHO Please place a comment on the Github issue that addresses the problem, and we'll try to fix it in a timely manner.
		ECHO If no such Github issue exists, please submit a new issue containing the output of this script.
		pause
		EXIT /B
	)
)

Rem Build the binaries and libraries
cmake --build build --config Release --target ALL_BUILD -- /maxcpucount:10
IF ERRORLEVEL 1 (
    ECHO The build failed! 
    ECHO If you are working on the Airbrakes code, check the output of the build process.
    ECHO If you believe that this problem came from upstream, please place a comment on the Github issue that addresses the problem, and we'll try to fix it in a timely manner.
    ECHO If no such Github issue exists, please submit a new issue containing the output of this script.
pause
    EXIT /B
)
ECHO Build complete!
pause