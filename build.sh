#!/bin/bash

#Set info text color
BLUE="\033[1;34m" # light blue
NC="\033[0m" # No Color
#Attempt to update tools
echo -e "${BLUE}Attempting to update tools via apt${NC}"
if ! [ -x "$(command -v apt-get)" ]; then
  echo "Apt is not installed on this machine. Skipping tool update" >&2
  exit 1
else
  sudo apt-get update -qq
  echo -e "${BLUE}Attempting to update/install CMake, Make, and GCC${NC}"
  sudo apt-get install git make cmake gcc -y -f
fi


#Check if Git is installed
if ! [ -x "$(command -v git)" ]; then
  echo "Git is not installed. Skipping update" >&2
else
  echo -e "${BLUE}Attempting to update via Git${NC}"
  git submodule update --init --recursive
fi

#Actualy build the code
echo -e "${BLUE}Generating Make scripts${NC}"
cmake .
if ! [ $? -eq 0 ]; then
  echo "CMake failed!" >&2
  echo "If you are working on the Airbrakes code, check the output of the build process." >&2
  echo "If you believe that this problem came from upstream, please place a comment on the Github issue that addresses the problem, and we will try to fix it in a timely manner." >&2
  echo "If no such Github issue exists, please submit a new issue containing the output of this script." >&2
  exit 1
fi
echo -e "${BLUE}Building Airbrakes code with Make${NC}"
make -j4
if ! [ $? -eq 0 ]; then
  echo "Building with Make/GCC failed!" >&2
  echo "If you are working on the Airbrakes code, check the output of the build process." >&2
  echo "If you believe that this problem came from upstream, please place a comment on the Github issue that addresses the problem, and we will try to fix it in a timely manner." >&2
  echo "If no such Github issue exists, please submit a new issue containing the output of this script." >&2
  exit 2
fi
echo -e "${BLUE}Build complete!${NC}"