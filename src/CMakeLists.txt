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
