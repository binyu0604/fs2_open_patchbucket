
include(libcode.cmake)

list(APPEND fred2_SOURCES
	code/fred2/altshipclassdlg.cpp
	code/fred2/altshipclassdlg.h
	code/fred2/fictionviewerdlg.cpp
	code/fred2/fictionviewerdlg.h
	code/fred2/addvariabledlg.cpp
	code/fred2/addvariabledlg.h
	code/fred2/adjustgriddlg.cpp
	code/fred2/adjustgriddlg.h
	code/fred2/asteroideditordlg.cpp
	code/fred2/asteroideditordlg.h
	code/fred2/backgroundchooser.cpp
	code/fred2/backgroundchooser.h
	code/fred2/bgbitmapdlg.cpp
	code/fred2/bgbitmapdlg.h
	code/fred2/briefingeditordlg.cpp
	code/fred2/briefingeditordlg.h
	code/fred2/campaigneditordlg.cpp
	code/fred2/campaigneditordlg.h
	code/fred2/campaignfilelistbox.cpp
	code/fred2/campaignfilelistbox.h
	code/fred2/campaigntreeview.cpp
	code/fred2/campaigntreeview.h
	code/fred2/campaigntreewnd.cpp
	code/fred2/campaigntreewnd.h
	code/fred2/cmdbrief.cpp
	code/fred2/cmdbrief.h
	code/fred2/createwingdlg.cpp
	code/fred2/createwingdlg.h
	code/fred2/customwingnames.cpp
	code/fred2/customwingnames.h
	code/fred2/debriefingeditordlg.cpp
	code/fred2/debriefingeditordlg.h
	code/fred2/dialog1.cpp
	code/fred2/dialog1.h
	code/fred2/dumpstats.cpp
	code/fred2/dumpstats.h
	code/fred2/editor.h
	code/fred2/eventeditor.cpp
	code/fred2/eventeditor.h
	code/fred2/folderdlg.cpp
	code/fred2/folderdlg.h
	code/fred2/fred.cpp
	code/fred2/fred.h
	code/fred2/fred.rc
	code/fred2/freddoc.cpp
	code/fred2/freddoc.h
	code/fred2/fredrender.cpp
	code/fred2/fredrender.h
	code/fred2/fredstubs.cpp
	code/fred2/fredview.cpp
	code/fred2/fredview.h
	code/fred2/grid.cpp
	code/fred2/grid.h
	code/fred2/ignoreordersdlg.cpp
	code/fred2/ignoreordersdlg.h
	code/fred2/initialships.cpp
	code/fred2/initialships.h
	code/fred2/initialstatus.cpp
	code/fred2/initialstatus.h
	code/fred2/mainfrm.cpp
	code/fred2/mainfrm.h
	code/fred2/management.cpp
	code/fred2/management.h
	code/fred2/messageeditordlg.cpp
	code/fred2/messageeditordlg.h
	code/fred2/missiongoalsdlg.cpp
	code/fred2/missiongoalsdlg.h
	code/fred2/missionnotesdlg.cpp
	code/fred2/missionnotesdlg.h
	code/fred2/missionsave.cpp
	code/fred2/missionsave.h
	code/fred2/modifyvariabledlg.cpp
	code/fred2/modifyvariabledlg.h
	code/fred2/operatorargtypeselect.cpp
	code/fred2/operatorargtypeselect.h
	code/fred2/orienteditor.cpp
	code/fred2/orienteditor.h
	code/fred2/playerstarteditor.cpp
	code/fred2/playerstarteditor.h
	code/fred2/prefsdlg.cpp
	code/fred2/prefsdlg.h
	code/fred2/reinforcementeditordlg.cpp
	code/fred2/reinforcementeditordlg.h
	code/fred2/resource.h
	code/fred2/restrictpaths.cpp
	code/fred2/restrictpaths.h
	code/fred2/setglobalshipflags.cpp
	code/fred2/setglobalshipflags.h
	code/fred2/sexp_tree.cpp
	code/fred2/sexp_tree.h
	code/fred2/shieldsysdlg.cpp
	code/fred2/shieldsysdlg.h
	code/fred2/ship_select.cpp
	code/fred2/ship_select.h
	code/fred2/shipchecklistbox.cpp
	code/fred2/shipchecklistbox.h
	code/fred2/shipclasseditordlg.cpp
	code/fred2/shipclasseditordlg.h
	code/fred2/shipeditordlg.cpp
	code/fred2/shipeditordlg.h
	code/fred2/shipflagsdlg.cpp
	code/fred2/shipflagsdlg.h
	code/fred2/shipgoalsdlg.cpp
	code/fred2/shipgoalsdlg.h
	code/fred2/shipspecialdamage.cpp
	code/fred2/shipspecialdamage.h
	code/fred2/shipspecialhitpoints.cpp
	code/fred2/shipspecialhitpoints.h
	code/fred2/shiptexturesdlg.cpp
	code/fred2/shiptexturesdlg.h
	code/fred2/soundenvironmentdlg.cpp
	code/fred2/soundenvironmentdlg.h
	code/fred2/starfieldeditor.cpp
	code/fred2/starfieldeditor.h
	code/fred2/stdafx.cpp
	code/fred2/stdafx.h
	code/fred2/textviewdlg.cpp
	code/fred2/textviewdlg.h
	code/fred2/voiceactingmanager.cpp
	code/fred2/voiceactingmanager.h
	code/fred2/waypointpathdlg.cpp
	code/fred2/waypointpathdlg.h
	code/fred2/weaponeditordlg.cpp
	code/fred2/weaponeditordlg.h
	code/fred2/wing.cpp
	code/fred2/wing.h
	code/fred2/wing_editor.cpp
	code/fred2/wing_editor.h
)

add_executable(fred2 WIN32 ${fred2_SOURCES} ${libcode_SOURCES})
build_solution_tree(fred2)

list(APPEND fred2_DEFINES
	FRED
	WINVER=0x0501
	_WIN32_WINNT=0x0501
	_WINDOWS
	WIN32
	_CRT_SECURE_NO_DEPRECATE
	_SECURE_SCL=0
)

list(APPEND fred2_INCLUDE_DIRECTORIES
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

list(APPEND fred2_LINK_LIBRARIES
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

target_include_directories(fs2_open PRIVATE ${fred2_INCLUDE_DIRECTORIES})

target_link_libraries(fred2 ${fred2_LINK_LIBRARIES}
	debug "nafxcwd.lib"
	optimized "nafxcw.lib"
)

get_property(DEBUG_CONFIGURATIONS GLOBAL PROPERTY DEBUG_CONFIGURATIONS)
list(APPEND RELEASE_CONFIGURATIONS ${CMAKE_CONFIGURATION_TYPES})
list(REMOVE_ITEM RELEASE_CONFIGURATIONS ${DEBUG_CONFIGURATIONS})
foreach(RELEASE_CONFIGURATION ${RELEASE_CONFIGURATIONS})
	string(TOUPPER ${RELEASE_CONFIGURATION} RELEASE_CONFIGURATION)
	target_compile_definitions(fred2 PRIVATE $<$<CONFIG:${RELEASE_CONFIGURATION}>:NDEBUG;${fred2_DEFINES}>)
	string(REGEX REPLACE "_" "-" RELEASE_SUFFIX ${RELEASE_CONFIGURATION})
	string(REGEX REPLACE "RELEASE" "" RELEASE_SUFFIX ${RELEASE_SUFFIX})
	set_target_properties(fred2 PROPERTIES OUTPUT_NAME_${RELEASE_CONFIGURATION} "fred2_${VERSION_STRING}${RELEASE_SUFFIX}")
endforeach(RELEASE_CONFIGURATION ${RELEASE_CONFIGURATIONS})
foreach(DEBUG_CONFIGURATION ${DEBUG_CONFIGURATIONS})
	string(TOUPPER ${DEBUG_CONFIGURATION} DEBUG_CONFIGURATION)
	string(REGEX REPLACE "_" "-" DEBUG_SUFFIX ${DEBUG_CONFIGURATION})
	target_compile_definitions(fred2 PRIVATE $<$<CONFIG:${DEBUG_CONFIGURATION}>:_DEBUG;${fred2_DEFINES}>)
	set_target_properties(fred2 PROPERTIES OUTPUT_NAME_${DEBUG_CONFIGURATION} "fred2_${VERSION_STRING}-${DEBUG_SUFFIX}")
endforeach(DEBUG_CONFIGURATION ${DEBUG_CONFIGURATIONS})
if(MSVC)
	foreach(DEBUG_CONFIGURATION ${DEBUG_CONFIGURATIONS})
		target_compile_definitions(fred2 PRIVATE $<$<CONFIG:${DEBUG_CONFIGURATION}>:_DEBUG;PDB_DEBUGGING=1;_HAS_ITERATOR_DEBUGGING=0;${fred2_DEFINES}>)
	endforeach(DEBUG_CONFIGURATION ${DEBUG_CONFIGURATIONS})
endif(MSVC)