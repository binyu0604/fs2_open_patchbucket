
project(zlib C)

list(APPEND zlib_SOURCES
	adler32.c
	compress.c
	crc32.c
	crc32.h
	deflate.c
	deflate.h
	infback.c
	inffast.c
	inffast.h
	inffixed.h
	inflate.c
	inflate.h
	inftrees.c
	inftrees.h
	trees.c
	trees.h
	uncompr.c
	zconf.h
	zlib.h
	zutil.c
	zutil.h
)

add_library(z STATIC ${zlib_SOURCES})

set_target_properties(z PROPERTIES
	PROJECT_LABEL zlib
)