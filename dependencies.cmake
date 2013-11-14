# Dependencies
if(UNIX)
	link_directories(/usr/local/lib)

	find_package(JPEG REQUIRED)
	find_package(Lua51 REQUIRED)
	find_package(OpenAL REQUIRED)
	find_package(OpenGL REQUIRED)
	find_package(PNG REQUIRED)
	find_package(PkgConfig REQUIRED)
	pkg_check_modules(SDL2 REQUIRED sdl2)
	pkg_check_modules(OGG REQUIRED ogg)
	pkg_check_modules(THEORA REQUIRED theora)
	pkg_check_modules(VORBIS REQUIRED vorbis)
	pkg_check_modules(VORBISFILE REQUIRED vorbisfile)
	pkg_check_modules(JANSSON REQUIRED jansson)

	# Mongoose
	add_subdirectory(${PROJECT_SOURCE_DIR}/mongoose)
	set(MONGOOSE_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/mongoose)
elseif(MSVC)
	# JPEG
	add_subdirectory(${PROJECT_SOURCE_DIR}/libjpeg)
	set(JPEG_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/libjpeg")

	# zlib
	add_subdirectory(${PROJECT_SOURCE_DIR}/zlib)
	set(ZLIB_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/zlib")

	# PNG
	add_subdirectory(${PROJECT_SOURCE_DIR}/libpng)
	set(PNG_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/libpng")

	# Lua 5.1
	add_subdirectory(${PROJECT_SOURCE_DIR}/lua)
	set(LUA_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/lua")

	set_target_properties(jpeg png lua z PROPERTIES
			COMPILE_FLAGS "/W0"
			FOLDER "3rdparty"
			STATIC_LIBRARY_FLAGS "/LTCG"
	)

	# Ogg
	add_library(ogg STATIC IMPORTED)
	set_target_properties(ogg PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/oggvorbis/lib/ogg_static.lib
			IMPORTED_LOCATION_DEBUG ${PROJECT_SOURCE_DIR}/oggvorbis/lib/ogg_static_d.lib
	)
	set(OGG_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/oggvorbis/include")

	# Vorbis
	add_library(vorbis STATIC IMPORTED)
	set_target_properties(vorbis PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/oggvorbis/lib/vorbis_static.lib
			IMPORTED_LOCATION_DEBUG ${PROJECT_SOURCE_DIR}/oggvorbis/lib/vorbis_static_d.lib
	)
	set(VORBIS_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/oggvorbis/include")

	# Vorbisfile
	add_library(vorbisfile STATIC IMPORTED)
	set_target_properties(vorbisfile PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/oggvorbis/lib/vorbisfile_static.lib
			IMPORTED_LOCATION_DEBUG ${PROJECT_SOURCE_DIR}/oggvorbis/lib/vorbisfile_static_d.lib
	)
	set(VORBISFILE_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/oggvorbis/include")

	# Theora
	add_library(theora STATIC IMPORTED)
	set_target_properties(theora PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/oggvorbis/lib/theora_static.lib
			IMPORTED_LOCATION_DEBUG ${PROJECT_SOURCE_DIR}/oggvorbis/lib/theora_static_d.lib
	)
	set(THEORA_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/oggvorbis/include")

	# OpenAL
	add_library(openal STATIC IMPORTED)
	set_target_properties(openal PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/openal/libs/win32/openal32.lib
	)
	set(OPENAL_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/openal/include")

	# Various DirectX bits.
	list(APPEND FSO_DIRECTX_LIBRARIRES
		${PROJECT_SOURCE_DIR}/code/directx/dxguid.lib
		${PROJECT_SOURCE_DIR}/code/directx/strmiids.lib
		${PROJECT_SOURCE_DIR}/code/directx/vdinput.lib
		${PROJECT_SOURCE_DIR}/code/directx/vdsound.lib
	)

	# Windows libraries.
	list(APPEND FSO_WINDOWS_LIBRARIRES
		comctl32.lib
		msacm32.lib
		odbc32.lib
		odbccp32.lib
		vfw32.lib
		winmm.lib
		wsock32.lib
	)
endif()
