# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

project ("USAT")



# Include sub-projects.
add_subdirectory ("src")
add_subdirectory("algorithms")

# Include external libraries

# Include submodules
find_package(Git QUIET)
if(GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
# Update submodules as needed
    option(GIT_SUBMODULE "Check submodules during build" ON)
    if(GIT_SUBMODULE)
        message(STATUS "Submodule update")
        execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
                        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                        RESULT_VARIABLE GIT_SUBMOD_RESULT)
        if(NOT GIT_SUBMOD_RESULT EQUAL "0")
            message(FATAL_ERROR "git submodule update --init failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
        endif()
    endif()
endif()


# Add libconfig to the project
if(NOT EXISTS "${PROJECT_SOURCE_DIR}/extern/libconfig/CMakeLists.txt")
    message(FATAL_ERROR "The submodule libconfig was not downloaded! GIT_SUBMODULE was turned off or failed. Please update submodules and try again.")
endif()
set(BUILD_EXAMPLES OFF CACHE BOOL "Disable examples for Libconfig" FORCE)
set(BUILD_TESTS OFF CACHE BOOL "Disable tests for Libconfig" FORCE)
add_subdirectory(${PROJECT_SOURCE_DIR}/extern/libconfig/)

# Add spdlog to the project
if(NOT EXISTS "${PROJECT_SOURCE_DIR}/extern/spdlog/CMakeLists.txt")
    message(FATAL_ERROR "The submodule spdlog was not downloaded! GIT_SUBMODULE was turned off or failed. Please update submodules and try again.")
endif()
add_subdirectory(${PROJECT_SOURCE_DIR}/extern/spdlog/)