
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
configure_builds(fs2_open)

include_directories(
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
	${JANSSON_INCLUDE_DIRS}
	${MONGOOSE_INCLUDE_DIR}
)

if(UNIX)
	add_definitions(
		-DSCP_UNIX
		-DLUA_USE_LINUX
	)
	include_directories(
		${OPENGL_INCLUDE_DIR}
		${SDL_INCLUDE_DIR}
	)
	target_link_libraries(fs2_open
		mongoose
		${OPENGL_LIBRARY}
		${SDL_LIBRARY}
		${JPEG_LIBRARY}
		${LUA_LIBRARY}
		${PNG_LIBRARY}
		${OPENAL_LIBRARY}
		${PKG_CONFIG_LINK_LIST}
	)
elseif(MSVC)
	add_definitions(
		/D_WINDOWS
		/DWIN32
		/D_CRT_SECURE_NO_DEPRECATE
		/D_CRT_SECURE_NO_WARNINGS
		/D_SECURE_SCL=0
		/DUSE_OPENAL
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
endif()

