
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

set(FS2OPEN_SOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/freespace.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/freespace.h
	${CMAKE_CURRENT_SOURCE_DIR}/freespace.rc
	${CMAKE_CURRENT_SOURCE_DIR}/freespaceresource.h
	${CMAKE_CURRENT_SOURCE_DIR}/levelpaging.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/levelpaging.h
	${PROJECT_SOURCE_DIR}/code/lab/lab.cpp
	${PROJECT_SOURCE_DIR}/code/lab/lab.h
	${PROJECT_SOURCE_DIR}/code/lab/wmcgui.cpp
	${PROJECT_SOURCE_DIR}/code/lab/wmcgui.h
)

add_executable(fs2_open WIN32 ${LIBCODE_SOURCES} ${FS2OPEN_SOURCES})
build_solution_tree(fs2_open)

set_target_properties(fs2_open PROPERTIES
	COMPILE_DEFINITIONS_DEBUG "_DEBUG"
	COMPILE_DEFINITIONS_RELEASE "NDEBUG"
	COMPILE_DEFINITIONS_SSE2 "NDEBUG"
	RELEASE_POSTFIX "_${VERSION_STRING}"
	DEBUG_POSTFIX "_${VERSION_STRING}-DEBUG"
)
include_directories(fs2_open PUBLIC
	${PROJECT_SOURCE_DIR}/code
	${JPEG_INCLUDE_DIR}
	${LUA_INCLUDE_DIR}
	${OPENAL_INCLUDE_DIR}
	${PNG_INCLUDE_DIR}
	${OGG_INCLUDE_DIRS}
	${VORBIS_INCLUDE_DIRS}
	${VORBISFILE_INCLUDE_DIRS}
	${THEROA_INCLUDE_DIRS}
	${ZLIB_INCLUDE_DIR}
)

if(UNIX)
	target_compile_definitions(fs2_open PUBLIC
		SCP_UNIX
		LUA_USE_LINUX
	)
	target_include_directories(fs2_open PUBLIC
		${OPENGL_INCLUDE_DIR}
		${SDL_INCLUDE_DIR}
	)
	target_link_libraries(fs2_open
		${OGG_LIBRARIES}
		${OPENGL_LIBRARY}
		${SDL_LIBRARY}
		${THEORA_LIBRARIES}
		${VORBISFILE_LIBRARIES}
		${VORBIS_LIBRARIES}
		${JPEG_LIBRARY}
		${LUA_LIBRARY}
		${PNG_LIBRARY}
		${OPENAL_LIBRARY}
	)
elseif(MSVC)
	target_compile_definitions(fs2_open PUBLIC
		_WINDOWS
		WIN32
		_CRT_SECURE_NO_DEPRECATE
		_CRT_SECURE_NO_WARNINGS
		_SECURE_SCL=0
		USE_OPENAL
	)
	target_link_libraries(fs2_open
		ogg
		vorbis
		vorbisfile
		theora
		zlib
		png
		lua
		jpeg
		openal
		${DIRECTX_LIBRARIRES}
	)
	# NOTE: This doesn't work with the NMake generator.
	list(APPEND CMAKE_CXX_STANDARD_LIBRARIES
		comctl32.lib
		msacm32.lib
		odbc32.lib
		odbccp32.lib
		vfw32.lib
		winmm.lib
		wsock32.lib
	)
	set_target_properties(fs2_open PROPERTIES
		COMPILE_DEFINITIONS_DEBUG "PDB_DEBUGGING=1;_HAS_ITERATOR_DEBUGGING=0"
		SSE2_POSTFIX "_${VERSION_STRING}-SSE2"
	)
endif()