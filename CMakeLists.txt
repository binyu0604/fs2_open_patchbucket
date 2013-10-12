# CMake build script files for Freespace 2 Source Code Project.
#
# Files:
# CMakeLists.txt - This file.
# toolchain-gcc.cmake - GNU/GCC toolchain configuration.
# toolchain-msvc.cmake - Visual Studio toolchain configuration.
# dependencies.cmake - Dependencies, does lookup on Linux and builds/imports on Windows.
# code/CMakeLists.txt - CMakeLists.txt containing LIBCODE_SOURCES and other commons.
#                       Includes the fred2, wxfred2 and freespace2 CMake subdirectories.
# code/fred2/CMakeLists.txt - Fred2.
# code/wxfred2/CMakeLists.txt - wxfred2.
# code/freespace2/CMakeLists.txt - Freespace2.

project("FSSCP" C CXX)

if(MSVC)
	set(CMAKE_CONFIGURATION_TYPES "Debug;Release;SSE2" CACHE STRING "Available configurations" FORCE)
	set_property(GLOBAL PROPERTY USE_FOLDERS ON)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
else()
	if(NOT CMAKE_BUILD_TYPE)
		set(CMAKE_BUILD_TYPE "DEBUG" CACHE STRING "Default build configuration used." FORCE)
		message(WARNING "CMAKE_BUILD_TYPE was not specified, defaulting to Debug configuration.")
endif()

cmake_minimum_required(VERSION 2.8)

set(VERSION_STRING 3_6_19)

find_package(Git)
if(GIT_FOUND AND EXISTS ${PROJECT_SOURCE_DIR}/.git AND REV_VERSION)
	set(GIT_ARGS --no-pager rev-parse --short HEAD)
	execute_process(
		COMMAND ${GIT_EXECUTABLE} ${GIT_ARGS}
		WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
		OUTPUT_VARIABLE VERSION_STRING
		OUTPUT_STRIP_TRAILING_WHITESPACE
	)
endif()

# WARNING: Ugh ...
macro(build_solution_tree ${ARGV0})
	if(MSVC)
		get_target_property(${ARGV0}_SOURCES ${ARGV0} SOURCES)
		foreach(SOURCE_FILEPATH ${${ARGV0}_SOURCES})
			string(REGEX REPLACE "${PROJECT_SOURCE_DIR}/code/" "" SOURCE_LOCAL_FILEPATH ${SOURCE_FILEPATH})
			string(REGEX REPLACE ".*/" "" SOURCE_LOCAL_FILENAME ${SOURCE_LOCAL_FILEPATH})
			string(REGEX REPLACE "${SOURCE_LOCAL_FILENAME}" "" SOURCE_LOCAL_DIRPATH ${SOURCE_LOCAL_FILEPATH})
			string(REGEX REPLACE "/" "\\\\\\\\" SOURCE_GROUPNAME ${SOURCE_LOCAL_DIRPATH})
			source_group("${SOURCE_GROUPNAME}" FILES "${SOURCE_FILEPATH}")
		endforeach(SOURCE_FILEPATH ${${ARGV0}_SOURCES})
	endif(MSVC)
endmacro(build_solution_tree ${ARGV0})

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
	include(toolchain-gcc.cmake)
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
	include(toolchain-msvc.cmake)
endif()

include(dependencies.cmake)

add_subdirectory(code)
