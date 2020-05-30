@echo off
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
    git submodule update --init --recursive
    IF ERRORLEVEL 1 (
        ECHO Submodule update failed! The project may not work as expected because it's working on multiple or non-standard versions.
    ) ELSE (
        ECHO Submodule update was successful!
    )
)

where /q cmake
IF ERRORLEVEL 1 (
    ECHO CMake is missing. Ensure it is installed and placed in your PATH.
    ECHO Aborting
	pause
    EXIT /B
) ELSE (
    ECHO CMake found. Bulding
)

cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Release -H. -Bbuild -G "Unix Makefiles"
IF ERRORLEVEL 1 (
    ECHO The build failed on initialization! 
    ECHO Please place a comment on the Github issue that addresses the problem, and we'll try to fix it in a timely manner.
    ECHO If no such Github issue exists, please submit a new issue containing the output of this script.
	pause
    EXIT /B
)
cmake --build build --config Release --target all -- -j 8
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