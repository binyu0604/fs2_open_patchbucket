
project(jansson C)

list(APPEND JANSSON_SOURCES
	dump.c
	error.c
	hashtable.c
	hashtable.h
	jansson_config.h
	jansson.h
	jansson_private.h
	load.c
	memory.c
	pack_unpack.c
	strbuffer.c
	strbuffer.h
	strconv.c
	utf.c
	utf.h
	value.c
)

add_library(jansson STATIC ${JANSSON_SOURCES})
