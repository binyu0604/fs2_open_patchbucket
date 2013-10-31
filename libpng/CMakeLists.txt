
project(png C)

list(APPEND png_SOURCES
	png.c
	png.h
	pngconf.h
	pngdebug.h
	pngerror.c
	pngget.c
	pnginfo.h
	pnglibconf.h
	pngmem.c
	pngpread.c
	pngpriv.h
	pngread.c
	pngrio.c
	pngrtran.c
	pngrutil.c
	pngset.c
	pngstruct.h
	pngtrans.c
	pngwio.c
	pngwrite.c
	pngwtran.c
	pngwutil.c
)

add_library(png STATIC ${png_SOURCES})

set_target_properties(png PROPERTIES
	COMPILE_DEFINITIONS _CRT_SECURE_NO_WARNINGS
	COMPILE_DEFINITIONS_DEBUG PNG_DEBUG=1
	INCLUDE_DIRECTORIES "${ZLIB_INCLUDE_DIR}"
)