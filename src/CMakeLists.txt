# CMakeList.txt : CMake project for USAT, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project(USAT)


# Add source to this project's executable.
add_executable (USAT "USAT.cpp" "USAT.h" "Algorithm.cpp" "Algorithm.hpp")

# TODO: Add tests and install targets if needed.

# libconfig
if(CMAKE_HOST_WIN32)
    set(libname "libconfig")
else()
    set(libname "config")
endif()
target_include_directories(USAT PUBLIC ${CMAKE_SOURCE_DIR}/extern/libconfig/lib)
target_link_libraries(USAT PUBLIC ${libname}++ )