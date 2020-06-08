@echo off
Rem This script restores the repository and all its submodules to
Rem their original state, DESTROYING ALL YOUR CHANGES.

Rem Please be careful running this script.

Rem Source control is difficult without Git. Quit if Git can't be found
where /q git

IF ERRORLEVEL 1 (
	ECHO Couldn't find Git. Aborting.
	exit 1
) ELSE (
	ECHO Git found. Cleaning. 
)

Rem See https://gist.github.com/nicktoumpelis/11214362
git clean -xfd
git submodule foreach --recursive git clean -xfd
git reset --hard
git submodule foreach --recursive git reset --hard