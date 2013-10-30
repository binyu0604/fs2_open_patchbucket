# Dependencies
if(UNIX)
	link_directories(/usr/local/lib)

	find_package(JPEG REQUIRED)
	find_package(Lua51 REQUIRED)
	find_package(OpenAL REQUIRED)
	find_package(OpenGL REQUIRED)
	find_package(PNG REQUIRED)
	find_package(SDL REQUIRED)
	find_package(PkgConfig REQUIRED)
	pkg_check_modules(OGG REQUIRED ogg)
	pkg_check_modules(THEORA REQUIRED theora)
	pkg_check_modules(VORBIS REQUIRED vorbis)
	pkg_check_modules(VORBISFILE REQUIRED vorbisfile)
	pkg_check_modules(JANSSON REQUIRED jansson)

	list(APPEND PKG_CONFIG_LINK_LIST
		${OGG_LIBRARIES}
		${THEORA_LIBRARIES}
		${VORBIS_LIBRARIES}
		${VORBISFILE_LIBRARIES}
		${JANSSON_LIBRARIES}
	)
	list(REMOVE_DUPLICATES PKG_CONFIG_LINK_LIST)

	# Mongoose
	add_subdirectory(${PROJECT_SOURCE_DIR}/mongoose)
	set(MONGOOSE_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/mongoose)
elseif(MSVC)
	# JPEG
	add_library(jpeg STATIC
		libjpeg/jaricom.c
		libjpeg/jcapimin.c
		libjpeg/jcapistd.c
		libjpeg/jcomapi.c
		libjpeg/jconfig.h
		libjpeg/jcparam.c
		libjpeg/jctrans.c
		libjpeg/jdapimin.c
		libjpeg/jdapistd.c
		libjpeg/jdarith.c
		libjpeg/jdatasrc.c
		libjpeg/jdcoefct.c
		libjpeg/jdcolor.c
		libjpeg/jdct.h
		libjpeg/jddctmgr.c
		libjpeg/jdhuff.c
		libjpeg/jdinput.c
		libjpeg/jdmainct.c
		libjpeg/jdmarker.c
		libjpeg/jdmaster.c
		libjpeg/jdmerge.c
		libjpeg/jdpostct.c
		libjpeg/jdsample.c
		libjpeg/jdtrans.c
		libjpeg/jerror.c
		libjpeg/jerror.h
		libjpeg/jidctflt.c
		libjpeg/jidctfst.c
		libjpeg/jidctint.c
		libjpeg/jinclude.h
		libjpeg/jmemmgr.c
		libjpeg/jmemnobs.c
		libjpeg/jmemsys.h
		libjpeg/jmorecfg.h
		libjpeg/jpegint.h
		libjpeg/jpeglib.h
		libjpeg/jquant1.c
		libjpeg/jquant2.c
		libjpeg/jutils.c
		libjpeg/jversion.h
	)
	set_target_properties(jpeg
		PROPERTIES
			COMPILE_DEFINITIONS _CRT_SECURE_NO_WARNINGS
	)
	set(JPEG_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/libjpeg")

	# zlib
	add_library(zlib STATIC
		zlib/adler32.c
		zlib/compress.c
		zlib/crc32.c
		zlib/crc32.h
		zlib/deflate.c
		zlib/deflate.h
		zlib/infback.c
		zlib/inffast.c
		zlib/inffast.h
		zlib/inffixed.h
		zlib/inflate.c
		zlib/inflate.h
		zlib/inftrees.c
		zlib/inftrees.h
		zlib/trees.c
		zlib/trees.h
		zlib/uncompr.c
		zlib/zconf.h
		zlib/zlib.h
		zlib/zutil.c
		zlib/zutil.h
	)
	set(ZLIB_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/zlib")

	# PNG
	add_library(png STATIC
		libpng/png.c
		libpng/png.h
		libpng/pngconf.h
		libpng/pngdebug.h
		libpng/pngerror.c
		libpng/pngget.c
		libpng/pnginfo.h
		libpng/pnglibconf.h
		libpng/pngmem.c
		libpng/pngpread.c
		libpng/pngpriv.h
		libpng/pngread.c
		libpng/pngrio.c
		libpng/pngrtran.c
		libpng/pngrutil.c
		libpng/pngset.c
		libpng/pngstruct.h
		libpng/pngtrans.c
		libpng/pngwio.c
		libpng/pngwrite.c
		libpng/pngwtran.c
		libpng/pngwutil.c
	)
	set_target_properties(png
		PROPERTIES
			COMPILE_DEFINITIONS _CRT_SECURE_NO_WARNINGS
			COMPILE_DEFINITIONS_DEBUG PNG_DEBUG=1
			INCLUDE_DIRECTORIES "${ZLIB_INCLUDE_DIR}"
	)
	set(PNG_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/libpng")

	# Lua 5.1
	add_library(lua STATIC
		lua/lapi.c
		lua/lapi.h
		lua/lauxlib.c
		lua/lauxlib.h
		lua/lbaselib.c
		lua/lcode.c
		lua/lcode.h
		lua/ldblib.c
		lua/ldebug.c
		lua/ldebug.h
		lua/ldo.c
		lua/ldo.h
		lua/ldump.c
		lua/lfunc.c
		lua/lfunc.h
		lua/lgc.c
		lua/lgc.h
		lua/linit.c
		lua/liolib.c
		lua/llex.c
		lua/llex.h
		lua/llimits.h
		lua/lmathlib.c
		lua/lmem.c
		lua/lmem.h
		lua/loadlib.c
		lua/lobject.c
		lua/lobject.h
		lua/lopcodes.c
		lua/lopcodes.h
		lua/loslib.c
		lua/lparser.c
		lua/lparser.h
		lua/lstate.c
		lua/lstate.h
		lua/lstring.c
		lua/lstring.h
		lua/lstrlib.c
		lua/ltable.c
		lua/ltable.h
		lua/ltablib.c
		lua/ltm.c
		lua/ltm.h
		lua/lua.h
		lua/luaconf.h
		lua/lualib.h
		lua/lundump.c
		lua/lundump.h
		lua/lvm.c
		lua/lvm.h
		lua/lzio.c
		lua/lzio.h
		lua/print.c
	)
	set_target_properties(lua
		PROPERTIES
			COMPILE_FLAGS _CRT_SECURE_NO_WARNINGS
	)
	set(LUA_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/lua")

	set_target_properties(jpeg png lua zlib
		PROPERTIES
			COMPILE_FLAGS "/W0"
			FOLDER "3rdparty"
			STATIC_LIBRARY_FLAGS "/LTCG"
	)

	# Ogg
	add_library(ogg STATIC IMPORTED)
	set_target_properties(ogg
		PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/oggvorbis/lib/ogg_static.lib
			IMPORTED_LOCATION_DEBUG ${PROJECT_SOURCE_DIR}/oggvorbis/lib/ogg_static_d.lib
	)
	set(OGG_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/oggvorbis/include")

	# Vorbis
	add_library(vorbis STATIC IMPORTED)
	set_target_properties(vorbis
		PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/oggvorbis/lib/vorbis_static.lib
			IMPORTED_LOCATION_DEBUG ${PROJECT_SOURCE_DIR}/oggvorbis/lib/vorbis_static_d.lib
	)
	set(VORBIS_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/oggvorbis/include")

	# Vorbisfile
	add_library(vorbisfile STATIC IMPORTED)
	set_target_properties(vorbisfile
		PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/oggvorbis/lib/vorbisfile_static.lib
			IMPORTED_LOCATION_DEBUG ${PROJECT_SOURCE_DIR}/oggvorbis/lib/vorbisfile_static_d.lib
	)
	set(VORBISFILE_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/oggvorbis/include")

	# Theora
	add_library(theora STATIC IMPORTED)
	set_target_properties(theora
		PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/oggvorbis/lib/theora_static.lib
			IMPORTED_LOCATION_DEBUG ${PROJECT_SOURCE_DIR}/oggvorbis/lib/theora_static_d.lib
	)
	set(THEORA_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/oggvorbis/include")

	# OpenAL
	add_library(openal STATIC IMPORTED)
	set_target_properties(openal
		PROPERTIES
			IMPORTED_LOCATION ${PROJECT_SOURCE_DIR}/openal/libs/win32/openal32.lib
	)
	set(OPENAL_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/openal/include")

	# Various DirectX bits.
	list(APPEND DIRECTX_LIBRARIRES
		${PROJECT_SOURCE_DIR}/code/directx/dxguid.lib
		${PROJECT_SOURCE_DIR}/code/directx/strmiids.lib
		${PROJECT_SOURCE_DIR}/code/directx/vdinput.lib
		${PROJECT_SOURCE_DIR}/code/directx/vdsound.lib
	)

endif()
