
list(APPEND fs2_open_SOURCES
	code/freespace2/freespace.cpp
	code/freespace2/freespace.h
	code/freespace2/freespace.rc
	code/freespace2/freespaceresource.h
	code/freespace2/levelpaging.cpp
	code/freespace2/levelpaging.h
	code/lab/lab.cpp
	code/lab/lab.h
	code/lab/wmcgui.cpp
	code/lab/wmcgui.h
)

add_executable(fs2_open WIN32 ${fs2_open_SOURCES} $<TARGET_OBJECTS:libcode>)
build_solution_tree(fs2_open)
configure_builds(fs2_open)

if(UNIX)
	list(APPEND fs2_open_DEFINES
		SCP_UNIX
		LUA_USE_LINUX
	)
	list(APPEND fs2_open_INCLUDE_DIRECTORIES
		${PROJECT_SOURCE_DIR}/code
		${JANSSON_INCLUDE_DIRS}
		${JPEG_INCLUDE_DIR}
		${LUA_INCLUDE_DIR}
		${MONGOOSE_INCLUDE_DIR}
		${OGG_INCLUDE_DIRS}
		${OPENAL_INCLUDE_DIR}
		${OPENGL_INCLUDE_DIR}
		${PNG_INCLUDE_DIR}
		${SDL_INCLUDE_DIR}
		${THEROA_INCLUDE_DIRS}
		${VORBISFILE_INCLUDE_DIRS}
		${VORBIS_INCLUDE_DIRS}
		${ZLIB_INCLUDE_DIR}
	)
	list(APPEND fs2_open_LINK_LIBRARIES
		mongoose
		${JANSSON_LIBRARIES}
		${OGG_LIBRARIES}
		${THEORA_LIBRARIES}
		${VORBISFILE_LIBRARIES}
		${VORBIS_LIBRARIES}
 		${JPEG_LIBRARY}
 		${LUA_LIBRARY}
 		${OPENAL_LIBRARY}
 		${OPENGL_LIBRARY}
 		${PNG_LIBRARY}
 		${SDL_LIBRARY}
	)
	list(REMOVE_DUPLICATES fs2_open_LINK_LIBRARIES)
endif(UNIX)

if(MSVC)
	list(APPEND fs2_open_DEFINES
		_WINDOWS
		WIN32
		_CRT_SECURE_NO_DEPRECATE
		_CRT_SECURE_NO_WARNINGS
		_SECURE_SCL=0
		USE_OPENAL
	)
	list(APPEND fs2_open_LINK_LIBRARIES
		ogg
		vorbis
		vorbisfile
		theora
		zlib
		png
		lua
		jpeg
		openal
		${FSO_DIRECTX_LIBRARIRES}
		${FSO_WINDOWS_LIBRARIRES}
	)
endif()

target_link_libraries(fs2_open ${fs2_open_LINK_LIBRARIES})
set_target_properties(libcode fs2_open PROPERTIES
	COMPILE_DEFINITIONS "${fs2_open_DEFINES}"
	INCLUDE_DIRECTORIES "${fs2_open_INCLUDE_DIRECTORIES}"
)
