
project(mongoose C)

list(APPEND MONGOOSE_SOURCES
	mongoose.c
	mongoose.h
)

add_library(mongoose STATIC ${MONGOOSE_SOURCES})