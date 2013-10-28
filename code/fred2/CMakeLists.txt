
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

set(FRED2_SOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/altshipclassdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/altshipclassdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/fictionviewerdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/fictionviewerdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/addvariabledlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/addvariabledlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/adjustgriddlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/adjustgriddlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/asteroideditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/asteroideditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/backgroundchooser.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/backgroundchooser.h
	${CMAKE_CURRENT_SOURCE_DIR}/bgbitmapdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/bgbitmapdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/briefingeditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/briefingeditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/campaigneditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/campaigneditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/campaignfilelistbox.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/campaignfilelistbox.h
	${CMAKE_CURRENT_SOURCE_DIR}/campaigntreeview.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/campaigntreeview.h
	${CMAKE_CURRENT_SOURCE_DIR}/campaigntreewnd.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/campaigntreewnd.h
	${CMAKE_CURRENT_SOURCE_DIR}/cmdbrief.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/cmdbrief.h
	${CMAKE_CURRENT_SOURCE_DIR}/createwingdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/createwingdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/customwingnames.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/customwingnames.h
	${CMAKE_CURRENT_SOURCE_DIR}/debriefingeditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/debriefingeditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/dialog1.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/dialog1.h
	${CMAKE_CURRENT_SOURCE_DIR}/dumpstats.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/dumpstats.h
	${CMAKE_CURRENT_SOURCE_DIR}/editor.h
	${CMAKE_CURRENT_SOURCE_DIR}/eventeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/eventeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/folderdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/folderdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/fred.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/fred.h
	${CMAKE_CURRENT_SOURCE_DIR}/fred.rc
	${CMAKE_CURRENT_SOURCE_DIR}/freddoc.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/freddoc.h
	${CMAKE_CURRENT_SOURCE_DIR}/fredrender.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/fredrender.h
	${CMAKE_CURRENT_SOURCE_DIR}/fredstubs.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/fredview.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/fredview.h
	${CMAKE_CURRENT_SOURCE_DIR}/grid.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/grid.h
	${CMAKE_CURRENT_SOURCE_DIR}/ignoreordersdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/ignoreordersdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/initialships.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/initialships.h
	${CMAKE_CURRENT_SOURCE_DIR}/initialstatus.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/initialstatus.h
	${CMAKE_CURRENT_SOURCE_DIR}/mainfrm.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/mainfrm.h
	${CMAKE_CURRENT_SOURCE_DIR}/management.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/management.h
	${CMAKE_CURRENT_SOURCE_DIR}/messageeditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/messageeditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/missiongoalsdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/missiongoalsdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/missionnotesdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/missionnotesdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/missionsave.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/missionsave.h
	${CMAKE_CURRENT_SOURCE_DIR}/modifyvariabledlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/modifyvariabledlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/operatorargtypeselect.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/operatorargtypeselect.h
	${CMAKE_CURRENT_SOURCE_DIR}/orienteditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/orienteditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/playerstarteditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/playerstarteditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/prefsdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/prefsdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/reinforcementeditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/reinforcementeditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/resource.h
	${CMAKE_CURRENT_SOURCE_DIR}/restrictpaths.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/restrictpaths.h
	${CMAKE_CURRENT_SOURCE_DIR}/setglobalshipflags.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/setglobalshipflags.h
	${CMAKE_CURRENT_SOURCE_DIR}/sexp_tree.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/sexp_tree.h
	${CMAKE_CURRENT_SOURCE_DIR}/shieldsysdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shieldsysdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/ship_select.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/ship_select.h
	${CMAKE_CURRENT_SOURCE_DIR}/shipchecklistbox.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shipchecklistbox.h
	${CMAKE_CURRENT_SOURCE_DIR}/shipclasseditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shipclasseditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/shipeditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shipeditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/shipflagsdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shipflagsdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/shipgoalsdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shipgoalsdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/shipspecialdamage.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shipspecialdamage.h
	${CMAKE_CURRENT_SOURCE_DIR}/shipspecialhitpoints.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shipspecialhitpoints.h
	${CMAKE_CURRENT_SOURCE_DIR}/shiptexturesdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/shiptexturesdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/soundenvironmentdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/soundenvironmentdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/starfieldeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/starfieldeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/stdafx.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/stdafx.h
	${CMAKE_CURRENT_SOURCE_DIR}/textviewdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/textviewdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/voiceactingmanager.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/voiceactingmanager.h
	${CMAKE_CURRENT_SOURCE_DIR}/waypointpathdlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/waypointpathdlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/weaponeditordlg.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/weaponeditordlg.h
	${CMAKE_CURRENT_SOURCE_DIR}/wing.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/wing.h
	${CMAKE_CURRENT_SOURCE_DIR}/wing_editor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/wing_editor.h
)

set_source_files_properties(
	${CMAKE_CURRENT_SOURCE_DIR}/fred.rc
		PROPERTIES
			LANGUAGE RC
)

set(CMAKE_MFC_FLAG 1)

add_executable(fred2 WIN32 ${LIBCODE_SOURCES} ${FRED2_SOURCES})
build_solution_tree(fred2)

set_target_properties(fred2 PROPERTIES
	COMPILE_DEFINITIONS_RELEASE "NDEBUG"
	COMPILE_DEFINITIONS_RELEASE_SSE "NDEBUG"
	COMPILE_DEFINITIONS_RELEASE_SSE2 "NDEBUG"
	COMPILE_DEFINITIONS_RELEASE_AVX "NDEBUG"
	COMPILE_DEFINITIONS_DEBUG "_DEBUG;PDB_DEBUGGING=1;_HAS_ITERATOR_DEBUGGING=0"
	COMPILE_DEFINITIONS_DEBUG_SSE "_DEBUG;PDB_DEBUGGING=1;_HAS_ITERATOR_DEBUGGING=0"
	COMPILE_DEFINITIONS_DEBUG_SSE2 "_DEBUG;PDB_DEBUGGING=1;_HAS_ITERATOR_DEBUGGING=0"
	COMPILE_DEFINITIONS_DEBUG_AVX "_DEBUG;PDB_DEBUGGING=1;_HAS_ITERATOR_DEBUGGING=0"
	RELEASE_POSTFIX "_${VERSION_STRING}"
	RELEASE_SSE_POSTFIX "_${VERSION_STRING}-SSE"
	RELEASE_SSE2_POSTFIX "_${VERSION_STRING}-SSE2"
	RELEASE_AVX_POSTFIX "_${VERSION_STRING}-AVX"
	DEBUG_POSTFIX "_${VERSION_STRING}-DEBUG"
	DEBUG_SSE_POSTFIX "_${VERSION_STRING}-DEBUG-SSE"
	DEBUG_SSE2_POSTFIX "_${VERSION_STRING}-DEBUG-SSE2"
	DEBUG_AVX_POSTFIX "_${VERSION_STRING}-DEBUG-AVX"
)

add_definitions(
	/DFRED
	/DWINVER=0x0501
	/D_WIN32_WINNT=0x0501
	/D_WINDOWS
	/DWIN32
	/D_CRT_SECURE_NO_DEPRECATE
	/D_SECURE_SCL=0
)
include_directories(
	${PROJECT_SOURCE_DIR}/code
	${JPEG_INCLUDE_DIR}
	${LUA_INCLUDE_DIR}
	${OPENAL_INCLUDE_DIR}
	${PNG_INCLUDE_DIR}
	${ZLIB_INCLUDE_DIR}
	${OGG_INCLUDE_DIRS}
	${VORBIS_INCLUDE_DIRS}
	${VORBISFILE_INCLUDE_DIRS}
	${THEROA_INCLUDE_DIRS}
)
target_link_libraries(fred2
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
	debug "nafxcwd.lib"
	optimized "nafxcw.lib"
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
