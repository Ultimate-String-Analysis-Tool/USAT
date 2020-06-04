# CMakeList.txt : CMake project for CaesarCipher, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

# Add source to this project's executable.
add_executable (CaesarCipher "CaesarCipher.cpp" "CaesarCipher.h")

#Manually place the CaesarCipher binary into its own folder under bin/algorithms/
message("Caesar Cipher runtime output directory: " ${ALGO_FULL_DIRECTORY})
# First for the generic no-config case (e.g. with mingw)
set_target_properties(CaesarCipher PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${ALGO_FULL_DIRECTORY})
# Second, for multi-config builds (e.g. msvc)
foreach( OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES} )
    string( TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG )
    set_target_properties(CaesarCipher PROPERTIES RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${ALGO_FULL_DIRECTORY})
endforeach( OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES )