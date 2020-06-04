# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

project ("CaesarCipher")


# Set the directory of the executable
set(ALGO_DIRECTORY_NAME CaesarCipher)

# Manually place the CaesarCipher binary into its own folder under bin/algorithms/
# This is done with the CMake file in the algorithm subdirectory
set(ALGO_FULL_DIRECTORY ${CMAKE_HOME_DIRECTORY}/bin/algorithms/${ALGO_DIRECTORY_NAME})

# Print the build directory of this project
message("    ${Blue}Runtime output directory: ${ALGO_FULL_DIRECTORY}${ColorReset}")

# Include sub-projects.
add_subdirectory ("src")

# Copy specs.txt to the build folder
configure_file(specs.cfg ${ALGO_FULL_DIRECTORY}/specs.txt COPYONLY)