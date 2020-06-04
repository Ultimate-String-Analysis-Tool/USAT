# CMakeList.txt : CMake project for USAT, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project(USAT)

set(USAT_PROJECT_SOURCE 
"USAT.cpp"
"Algorithm.cpp"
"Encryption.cpp"
)

set(USAT_PROJECT_HEADERS 
"USAT.hpp"
"Algorithm.hpp"
"Encryption.hpp"
)

# Add source to this project's executable.
add_executable (USAT ${USAT_PROJECT_SOURCE} ${USAT_PROJECT_HEADERS})


# libconfig
if(CMAKE_HOST_WIN32)
    set(libname "libconfig")
else()
    set(libname "config")
endif()
target_include_directories(USAT PUBLIC ${CMAKE_SOURCE_DIR}/extern/libconfig/lib)
target_link_libraries(USAT PUBLIC ${libname}++ )
target_link_libraries(USAT PRIVATE spdlog::spdlog_header_only)

#Manually place the CaesarCipher binary into its own folder under bin/algorithms/
set(USAT_FULL_DIRECTORY ${CMAKE_HOME_DIRECTORY}/bin/)
message("${Green}USAT runtime output directory: ${USAT_FULL_DIRECTORY}${ResetColor}")
# First for the generic no-config case (e.g. with mingw)
set_target_properties(USAT PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${USAT_FULL_DIRECTORY})
# Second, for multi-config builds (e.g. msvc)
foreach( OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES} )
    string( TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG )
    set_target_properties(USAT PROPERTIES RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${USAT_FULL_DIRECTORY})
endforeach( OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES )

