cmake_minimum_required(VERSION 3.15)
project(FFmpegStaticExe)
set(CMAKE_CXX_STANDARD 20)

add_executable(${PROJECT_NAME} main.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE ..\\ffmpeg-static-lib\\include)
target_include_directories(${PROJECT_NAME} PRIVATE ..\\ffmpeg-static-lib\\libffmpeg\\include)

target_link_directories(${PROJECT_NAME} PRIVATE lib)
target_link_libraries(${PROJECT_NAME} PRIVATE alpha-ffmpeg-static-all.lib)