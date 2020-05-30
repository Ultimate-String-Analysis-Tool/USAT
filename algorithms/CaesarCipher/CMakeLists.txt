# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

project ("CaesarCipher")

set(ALGO_DIRECTORY_NAME CaesarCipher)

#Place the executable in the /bin directory
set(ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/algorithms/${ALGO_DIRECTORY_NAME})
set(LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/algorithms/${ALGO_DIRECTORY_NAME})
set(RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/algorithms/${ALGO_DIRECTORY_NAME})
set(EXECUTABLE_OUTPUT_PATH ${RUNTIME_OUTPUT_DIRECTORY})

# Include sub-projects.
add_subdirectory ("src")

#Copy specs.txt to the build folder
configure_file(specs.txt ${RUNTIME_OUTPUT_DIRECTORY}/specs.txt COPYONLY)