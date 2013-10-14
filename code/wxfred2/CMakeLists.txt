
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

set(WXFRED2_SOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/res/select.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/constz.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/constx.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/selectrot.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/constyz.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/constxy.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/wingform.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/zoomsel.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/constxz.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/consty.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/wingdisband.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/showdist.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/orbitsel.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/zoomext.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/rotlocal.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/selectmove.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/selectlock.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/res/selectlist.png.h
	${CMAKE_CURRENT_SOURCE_DIR}/base/wxfred_base.h
	${CMAKE_CURRENT_SOURCE_DIR}/base/wxfred_base.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgobjecteditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgobjecteditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgvoiceactingmanager.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmdebriefingeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgbackgroundeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgmissionobjectiveseditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmbriefingeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmteamloadouteditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgmissionobjectiveseditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgmissionspecseditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmdebriefingeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgfictionviewer.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgvoiceactingmanager.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgsoundenvironment.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmcommandbriefingeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmbriefingeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgshieldsystemeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgreinforcementseditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgeventseditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmteamloadouteditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmcommandbriefingeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmwaypointeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgasteroidfieldeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgsetglobalshipflagseditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgshieldsystemeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmshipseditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgfictionviewer.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgreinforcementspicker.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmcampaigneditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgasteroidfieldeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgreinforcementspicker.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgreinforcementseditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmcampaigneditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgbackgroundeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmshipseditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgeventseditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgsetglobalshipflagseditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmwingeditor.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmwingeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/frmwaypointeditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgsoundenvironment.h
	${CMAKE_CURRENT_SOURCE_DIR}/editors/dlgmissionspecseditor.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/glcviewport.h
	${CMAKE_CURRENT_SOURCE_DIR}/misc/dlgmissionstats.h
	${CMAKE_CURRENT_SOURCE_DIR}/misc/dlgmissionstats.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/wxfred2.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/wxfred2.h
	${CMAKE_CURRENT_SOURCE_DIR}/help/dlgsexphelp.h
	${CMAKE_CURRENT_SOURCE_DIR}/help/dlgsexphelp.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/help/dlgaboutbox.h
	${CMAKE_CURRENT_SOURCE_DIR}/help/dlgaboutbox.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/frmfred2.h
	${CMAKE_CURRENT_SOURCE_DIR}/frmfred2.cpp
)

include(${wxWidgets_USE_FILE})

add_executable(wxfred2 WIN32 ${WXFRED2_SOURCES})
build_solution_tree(wxfred2)

set_target_properties(wxfred2
	PROPERTIES
		COMPILE_DEFINITIONS_DEBUG _DEBUG
		COMPILE_DEFINITIONS_RELEASE NDEBUG
		COMPILE_DEFINITIONS_SSE2 NDEBUG
		RELEASE_POSTFIX "_${VERSION_STRING}"
		DEBUG_POSTFIX "_${VERSION_STRING}-DEBUG"
		SSE2_POSTFIX "_${VERSION_STRING}-SSE2"
)
target_compile_definitions(wxfred2 PUBLIC
	FRED
)
target_include_directories(wxfred2 PUBLIC
	${PROJECT_SOURCE_DIR}/code
	${CMAKE_CURRENT_SOURCE_DIR}
	${JPEG_INCLUDE_DIR}
	${LUA_INCLUDE_DIR}
	${OPENAL_INCLUDE_DIR}
	${PNG_INCLUDE_DIR}
	${ZLIB_INCLUDE_DIR}
	${OGG_INCLUDE_DIRS}
	${VORBIS_INCLUDE_DIRS}
	${VORBISFILE_INCLUDE_DIRS}
	${THEROA_INCLUDE_DIRS}
	${wxWidgets_INCLUDE_DIRS}
)

if(UNIX)
	target_compile_definitions(wxfred2 PUBLIC
		SCP_UNIX
		LUA_USE_LINUX
	)
	target_include_directories(wxfred2 PUBLIC
		${OPENGL_INCLUDE_DIR}
		${SDL_INCLUDE_DIR}
	)
	target_link_libraries(wxfred2
		${OGG_LIBRARIES}
		${OPENGL_LIBRARY}
		${SDL_LIBRARY}
		${THEORA_LIBRARIES}
		${VORBISFILE_LIBRARIES}
		${VORBIS_LIBRARIES}
		${JPEG_LIBRARY}
		${LUA_LIBRARY}
		${PNG_LIBRARY}
		${OPENAL_LIBRARY}
		${wxWidgets_LIBRARIES}
	)
	set_target_properties(wxfred2
		PROPERTIES
			EXCLUDE_FROM_ALL TRUE
	)
elseif(MSVC)
	target_compile_definitions(wxfred2 PUBLIC
		WINVER=0x0501
		_WIN32_WINNT=0x0501
		_WINDOWS
		WIN32
	)
	target_link_libraries(wxfred2
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
		${wxWidgets_LIBRARIES}
	)
	list(APPEND CMAKE_CXX_STANDARD_LIBRARIES
		comctl32.lib
		msacm32.lib
		odbc32.lib
		odbccp32.lib
		vfw32.lib
		winmm.lib
		wsock32.lib
	)
	set_target_properties(wxfred2
		PROPERTIES
			COMPILE_DEFINITIONS_DEBUG "PDB_DEBUGGING=1;_HAS_ITERATOR_DEBUGGING=0"
			RELEASE_POSTFIX "_${VERSION_STRING}"
			DEBUG_POSTFIX "_${VERSION_STRING}-DEBUG"
			SSE2_POSTFIX "_${VERSION_STRING}-SSE2"
	)
endif()
