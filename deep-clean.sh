#!/bin/bash

# This script restores the repository and all its submodules to
# their original state, DESTROYING ALL YOUR CHANGES.
# 
# Please be careful running this script.
# 
# Source control is difficult without Git. Quit if Git can't be found

#Set info text color
BLUE="\033[1;34m" # light blue
NC="\033[0m" # No Color

# Source control is difficult without Git. Quit if Git can't be found
if ! [ -x "$(command -v git)" ]; then
  echo "Couldn't find Git. Aborting." >&2
  exit 1
else
  echo -e "${BLUE}Attempting restore the repository via Git${NC}"
fi

# See https://gist.github.com/nicktoumpelis/11214362
git clean -xfd
git submodule foreach --recursive git clean -xfd
git reset --hard
git submodule foreach --recursive git reset --hard

echo -e "${BLUE}Deep clean complete.${NC}"
