# GCC

unset(CMAKE_C_FLAGS)
if(DEFINED ENV{CFLAGS})
	set(CMAKE_C_FLAGS $ENV{CFLAGS})
endif(DEFINED ENV{CFLAGS})

unset(CMAKE_CXX_FLAGS)
if(DEFINED ENV{CXXFLAGS})
	set(CMAKE_CXX_FLAGS $ENV{CXXFLAGS})
endif(DEFINED ENV{CXXFLAGS})

if(NOT CMAKE_CXX_FLAGS)
	if(CMAKE_SIZEOF_VOID_P EQUAL 4)
		set(CMAKE_CXX_FLAGS "-march=i686 -mtune=generic -mfpmath=sse -msse -msse2 -ansi")
	elseif(CMAKE_SIZEOF_VOID_P EQUAL 8)
		set(CMAKE_CXX_FLAGS "-m64 -march=x86-64 -mtune=generic -msse -msse2 -ansi")
	endif()
endif(NOT CMAKE_CXX_FLAGS)

if(NOT CMAKE_C_FLAGS)
	if(CMAKE_SIZEOF_VOID_P EQUAL 4)
		set(CMAKE_C_FLAGS "-march=i686 -mtune=generic -mfpmath=sse -msse -msse2 -ansi")
	elseif(CMAKE_SIZEOF_VOID_P EQUAL 8)
		set(CMAKE_C_FLAGS "-m64 -march=x86-64 -mtune=generic -msse -msse2")
	endif()
endif(NOT CMAKE_C_FLAGS)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -funroll-loops -fsigned-char")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -funroll-loops -fsigned-char")

# Omit "deprecated conversion from string constant to 'char*'" warnings.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-write-strings")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-write-strings")
# Omit "unused parameter 'foo'" warnings.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-parameter")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-parameter")

set(CMAKE_EXE_LINKER_FLAGS "-Wl,-O1 -Wl,--as-needed")

option(FSO_USE_LTO "Build using GCC's Link Time Optimization feature" FALSE)
if(FSO_USE_LTO)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -flto")
	message(STATUS "FSO_USE_LTO is enabled. Linking will probably take a LONG time to complete.")
endif(FSO_USE_LTO)

option(FSO_USE_GRAPHITE "Build using GCC's Graphite feature" FALSE)
if(FSO_USE_GRAPHITE)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fgraphite-identity -ftree-loop-linear -floop-strip-mine -floop-block -floop-nest-optimize")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fgraphite-identity -ftree-loop-linear -floop-strip-mine -floop-block -floop-nest-optimize")
endif(FSO_USE_GRAPHITE)

option(FSO_USE_NATIVE "Build using -march=native" FALSE)
if(FSO_USE_NATIVE)
	string(REGEX REPLACE "-march=[^ ]*" "-march=native" CMAKE_C_FLAGS ${CMAKE_C_FLAGS})
	string(REGEX REPLACE "-mtune=[^ ]*\ " "" CMAKE_C_FLAGS ${CMAKE_C_FLAGS})
	string(REGEX REPLACE "-mss[^ ]*\ " "" CMAKE_C_FLAGS ${CMAKE_C_FLAGS})
	string(REGEX REPLACE "-march=[^ ]*" "-march=native" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
	string(REGEX REPLACE "-mtune=[^ ]*\ " "" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
	string(REGEX REPLACE "-mss[^ ]*\ " "" CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
	message(STATUS "FSO_USE_NATIVE is enabled. All instruction subsets supported by the local machine will be used, the resulting binary might not run on different machines.")
endif(FSO_USE_NATIVE)

# Release
set(CMAKE_C_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-Wl,--strip-all")

# Debug
set(CMAKE_C_FLAGS_DEBUG "-O0 -g -Wextra -Wshadow")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g -Wextra -Wshadow")