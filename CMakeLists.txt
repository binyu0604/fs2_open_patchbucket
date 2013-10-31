# CMake build script files for Freespace 2 Source Code Project.
#
# Files:
# CMakeLists.txt - This file.
# toolchain-gcc.cmake - GNU/GCC toolchain configuration.
# toolchain-msvc.cmake - Visual Studio toolchain configuration.
# dependencies.cmake - Dependencies, does lookup on Linux and builds/imports on Windows.
#
# libcode.cmake - libcode.
# fred2.cmake - Fred2.
# fs2_open.cmake - Freespace2.

project("FSSCP" C CXX)

set(CMAKE_CONFIGURATION_TYPES "")
list(APPEND CMAKE_CONFIGURATION_TYPES
	"Release;Release_SSE;Release_SSE2;Release_AVX"
	"Debug;Debug_SSE;Debug_SSE2;Debug_AVX"
)
set_property(GLOBAL PROPERTY DEBUG_CONFIGURATIONS "Debug;Debug_SSE;Debug_SSE2;Debug_AVX")
set(CMAKE_CONFIGURATION_TYPES ${CMAKE_CONFIGURATION_TYPES} CACHE STRING "Available configurations" FORCE)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

if(NOT CMAKE_BUILD_TYPE AND NOT MSVC)
	set(CMAKE_BUILD_TYPE "DEBUG" CACHE STRING "Default build configuration used." FORCE)
	message(WARNING "CMAKE_BUILD_TYPE was not specified, defaulting to Debug configuration.")
endif()

cmake_minimum_required(VERSION 2.8)

set(VERSION_STRING 3.7.1)

option(FSO_REV_VERSION "Use git shorthash as the version string" FALSE)
find_package(Git)
if(GIT_FOUND AND EXISTS ${PROJECT_SOURCE_DIR}/.git AND FSO_REV_VERSION)
	set(GIT_ARGS --no-pager rev-parse --short HEAD)
	execute_process(
		COMMAND ${GIT_EXECUTABLE} ${GIT_ARGS}
		WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
		OUTPUT_VARIABLE VERSION_STRING
		OUTPUT_STRIP_TRAILING_WHITESPACE
	)
endif()
find_package(Subversion)
if(SUBVERSION_FOUND AND EXISTS ${PROJECT_SOURCE_DIR}/.svn AND FSO_REV_VERSION)
	Subversion_WC_INFO(${PROJECT_SOURCE_DIR} FSO)
	set(VERSION_STRING "r${FSO_WC_REVISION}")
	message(STATUS ${VERSION_STRING})
endif()

# WARNING: Ugh ...
macro(build_solution_tree ${ARGV0})
	if(MSVC)
		get_target_property(${ARGV0}_SOURCES ${ARGV0} SOURCES)
		foreach(SOURCE_FILEPATH ${${ARGV0}_SOURCES})
			string(REGEX REPLACE "code/" "" SOURCE_LOCAL_FILEPATH ${SOURCE_FILEPATH})
			string(REGEX REPLACE "(.*)/" "" SOURCE_LOCAL_FILENAME ${SOURCE_LOCAL_FILEPATH})
			string(REGEX REPLACE "/${SOURCE_LOCAL_FILENAME}" "" SOURCE_LOCAL_DIRPATH ${SOURCE_LOCAL_FILEPATH})
			string(REGEX REPLACE "/" "\\\\\\\\" SOURCE_GROUPNAME ${SOURCE_LOCAL_DIRPATH})
			source_group("${SOURCE_GROUPNAME}\\\\" FILES "${SOURCE_FILEPATH}")
			message("source_group(${SOURCE_GROUPNAME} FILES ${SOURCE_FILEPATH})")
		endforeach(SOURCE_FILEPATH ${${ARGV0}_SOURCES})
	endif(MSVC)
endmacro(build_solution_tree ${ARGV0})

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
	include(toolchain-gcc.cmake)
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
	include(toolchain-msvc.cmake)
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
	include(toolchain-clang.cmake)
endif()

include(dependencies.cmake)

include(fs2_open.cmake)
include(fred2.cmake)
