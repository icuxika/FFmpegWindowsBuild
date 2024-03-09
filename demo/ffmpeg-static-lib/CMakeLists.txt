cmake_minimum_required(VERSION 3.15)
project(FFmpegStaticLib)
set(CMAKE_CXX_STANDARD 20)

file(GLOB SOURCES "src/*.cpp")

if (MSVC)
    add_compile_options(/utf-8)
endif()

set(LIB_STATIC_NAME alpha-ffmpeg-static)
add_library(${LIB_STATIC_NAME} STATIC ${SOURCES})
target_include_directories(${LIB_STATIC_NAME} PUBLIC include)

target_include_directories(${LIB_STATIC_NAME} PUBLIC libffmpeg\\include)
target_link_directories(${LIB_STATIC_NAME} PRIVATE libffmpeg\\lib\\x64)
target_link_libraries(${LIB_STATIC_NAME} PRIVATE libavcodec libavformat libavutil libswresample libswscale)