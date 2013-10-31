
project(jpeg C)

list(APPEND jpeg_SOURCES
	jaricom.c
	jcapimin.c
	jcapistd.c
	jcomapi.c
	jconfig.h
	jcparam.c
	jctrans.c
	jdapimin.c
	jdapistd.c
	jdarith.c
	jdatasrc.c
	jdcoefct.c
	jdcolor.c
	jdct.h
	jddctmgr.c
	jdhuff.c
	jdinput.c
	jdmainct.c
	jdmarker.c
	jdmaster.c
	jdmerge.c
	jdpostct.c
	jdsample.c
	jdtrans.c
	jerror.c
	jerror.h
	jidctflt.c
	jidctfst.c
	jidctint.c
	jinclude.h
	jmemmgr.c
	jmemnobs.c
	jmemsys.h
	jmorecfg.h
	jpegint.h
	jpeglib.h
	jquant1.c
	jquant2.c
	jutils.c
	jversion.h
)
add_library(jpeg STATIC ${jpeg_SOURCES})

set_target_properties(jpeg PROPERTIES
	COMPILE_DEFINITIONS _CRT_SECURE_NO_WARNINGS
)
