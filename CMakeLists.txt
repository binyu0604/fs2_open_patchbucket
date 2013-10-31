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

list(APPEND DEBUG_CONFIGURATIONS_LIST "Debug;Debug_SSE;Debug_SSE2;Debug_AVX")
list(APPEND CONFIGURATION_TYPES_LIST "Debug;Debug_SSE;Debug_SSE2;Debug_AVX;Release;Release_SSE;Release_SSE2;Release_AVX")
set(CMAKE_CONFIGURATION_TYPES ${CONFIGURATION_TYPES_LIST})
set_property(GLOBAL PROPERTY DEBUG_CONFIGURATIONS ${DEBUG_CONFIGURATIONS_LIST})
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
			string(REGEX REPLACE "${PROJECT_SOURCE_DIR}/code/" "" SOURCE_LOCAL_FILEPATH ${SOURCE_FILEPATH})
			string(REGEX REPLACE ".*/" "" SOURCE_LOCAL_FILENAME ${SOURCE_LOCAL_FILEPATH})
			string(REGEX REPLACE "${SOURCE_LOCAL_FILENAME}" "" SOURCE_LOCAL_DIRPATH ${SOURCE_LOCAL_FILEPATH})
			string(REGEX REPLACE "/" "\\\\\\\\" SOURCE_GROUPNAME ${SOURCE_LOCAL_DIRPATH})
			source_group("${SOURCE_GROUPNAME}" FILES "${SOURCE_FILEPATH}")
		endforeach(SOURCE_FILEPATH ${${ARGV0}_SOURCES})
	endif(MSVC)
endmacro(build_solution_tree ${ARGV0})

set(FSO_COMMON_RELEASE_DEFINES "NDEBUG")
set(FSO_COMMON_DEBUG_DEFINES "_DEBUG")
set(FSO_COMMON_DEBUG_DEFINES_MSVC "PDB_DEBUGGING=1;_HAS_ITERATOR_DEBUGGING=0")

macro(configure_builds ${ARGV0})
	get_property(DEBUG_CONFIGURATIONS_LIST GLOBAL PROPERTY DEBUG_CONFIGURATIONS)
	foreach(DEBUG_CONFIGURATION ${DEBUG_CONFIGURATIONS_LIST})
		string(TOUPPER ${DEBUG_CONFIGURATION} DEBUG_CONFIGURATION)
		set_target_properties(${ARGV0} PROPERTIES
			COMPILE_DEFINITIONS_${DEBUG_CONFIGURATION} "${FSO_COMMON_DEBUG_DEFINES}"
		)
		if(MSVC)
			set_target_properties(${ARGV0} PROPERTIES
				COMPILE_DEFINITIONS_${DEBUG_CONFIGURATION} "${FSO_COMMON_DEBUG_DEFINES_MSVC}"
			)
		endif(MSVC)
		string(REPLACE "_" "-" DEBUG_SUFFIX ${DEBUG_CONFIGURATION})
		set_target_properties(${ARGV0} PROPERTIES
			OUTPUT_NAME_${DEBUG_CONFIGURATION} "${ARGV0}_${VERSION_STRING}-${DEBUG_SUFFIX}"
		)
	endforeach(DEBUG_CONFIGURATION DEBUG_CONFIGURATIONS)

	list(APPEND RELEASE_CONFIGURATIONS_LIST ${CMAKE_CONFIGURATION_TYPES})
	list(REMOVE_ITEM RELEASE_CONFIGURATIONS_LIST ${DEBUG_CONFIGURATIONS_LIST})
	foreach(RELEASE_CONFIGURATION ${RELEASE_CONFIGURATIONS_LIST})
		string(TOUPPER ${RELEASE_CONFIGURATION} RELEASE_CONFIGURATION)
		set_target_properties(${ARGV0} PROPERTIES
			COMPILE_DEFINITIONS_${RELEASE_CONFIGURATION} "${FSO_COMMON_RELEASE_DEFINES}"
		)
		string(REPLACE "_" "-" RELEASE_CONFIGURATION ${RELEASE_CONFIGURATION})
		string(REGEX REPLACE "RELEASE" "" RELEASE_SUFFIX ${RELEASE_CONFIGURATION})
		set_target_properties(${ARGV0} PROPERTIES
			OUTPUT_NAME_${RELEASE_CONFIGURATION} "${ARGV0}_${VERSION_STRING}${RELEASE_SUFFIX}"
		)
	endforeach(RELEASE_CONFIGURATION ${RELEASE_CONFIGURATIONS_LIST})
endmacro()

if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
	include(toolchain-gcc.cmake)
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
	include(toolchain-msvc.cmake)
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
	include(toolchain-clang.cmake)
endif()

include(dependencies.cmake)

find_package(MFC)
if(MFC_FOUND)
	include(fred2.cmake)
endif(MFC_FOUND)

find_package(wxWidgets COMPONENTS gl core base)
if(wxWidgets_FOUND)
	#include(wxfred2.cmake)
endif(wxWidgets_FOUND)

include(libcode.cmake)
include(fs2_open.cmake)
