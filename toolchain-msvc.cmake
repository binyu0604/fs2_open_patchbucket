# Visual Studio

set(CMAKE_C_FLAGS "/MP /GS- /analyze- /Zc:wchar_t /errorReport:prompt /WX- /Zc:forScope /Gd /EHsc /nologo")
set(CMAKE_C_FLAGS_RELEASE "/GL /W2 /Gy- /Zi /O2 /Ob2 /fp:fast /GF /Oy /Oi /MT")
set(CMAKE_C_FLAGS_DEBUG "/W4 /Gy /ZI /Od /RTC1 /Gd /Oy- /MTd")
set(CMAKE_C_FLAGS_SSE2 "${CMAKE_C_FLAGS_RELEASE} /arch:SSE2")

set(CMAKE_CXX_FLAGS "/MP  /GS- /analyze- /Zc:wchar_t /errorReport:prompt /WX- /Zc:forScope /Gd /EHsc /nologo")
set(CMAKE_CXX_FLAGS_RELEASE "/GL /W2 /Gy- /Zi /O2 /Ob2 /fp:fast /GF /Oy /Oi /MT")
set(CMAKE_CXX_FLAGS_DEBUG "/W4 /Gy /ZI /Od /RTC1 /Gd /Oy- /MTd")
set(CMAKE_CXX_FLAGS_SSE2 "${CMAKE_CXX_FLAGS_RELEASE} /arch:SSE2")

set(CMAKE_EXE_LINKER_FLAGS "/MANIFEST /DYNAMICBASE:NO /MAPINFO:EXPORTS /SAFESEH:NO /MANIFESTUAC:NO")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /ERRORREPORT:PROMPT /NOLOGO")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "/LTCG /INCREMENTAL:NO /NODEFAULTLIB:\"libc.lib,libcd.lib,libci.lib\"")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "/DEBUG /INCREMENTAL /NODEFAULTLIB:\"libc.lib,libcd.lib,libcmt.lib,libci.lib\"")
set(CMAKE_EXE_LINKER_FLAGS_SSE2 "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
