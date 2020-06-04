# Every algorithm is its own standalone application in a subfolder, 
# and they likely contain CMake scripts.
#
# This script uses a macro to automatically find and build all the algorithms 
# with CMakeLists.txtunder this folder.

include(${CMAKE_HOME_DIRECTORY}/CMake/macros/subdirlist.cmake)

message("${BoldBlue}Searching for algorithms...${ColorReset}")
SUBDIRLIST(SUBDIRS ${CMAKE_CURRENT_SOURCE_DIR})
FOREACH(subdir ${SUBDIRS})
    message("${BoldBlue}--> Alorithm: ${subdir}${ColorReset}")
    ADD_SUBDIRECTORY(${subdir})
ENDFOREACH()
message("${BoldBlue}Algorithm search complete${ColorReset}")