# Windows 下构建一个静态库，包含FFmpeg静态库的内容

## 拷贝精简的FFmpeg静态库到指定目录
```
cd .\libffmpeg\lib\x64\
Get-ChildItem -Path C:\Users\icuxika\VSCodeProjects\FFmpegWindowsBuild\msvc\lib\x64\ -Filter "*.lib" | Where-Object { $_.Name -match "libavcodec\.lib|libavdevice\.lib|libavfilter\.lib|libavformat\.lib|libavutil\.lib|libpostproc\.lib|libswresample\.lib|libswscale\.lib" } | ForEach-Object { Copy-Item -Path $_.FullName -Destination . }
cd ../../../
```

## 构建
```
cmake -S . -B build
cmake --build .\build\ --config Release
```

## 将生成的静态库与FFmpeg的静态库合并为一个静态库`alpha-ffmpeg-static-all.lib 48.3 MB`
> 静态库的体积较大，不过在使用它静态构建exe时，MSVC会去除没有使用的代码
```
cd .\build\Release\
lib.exe /OUT:alpha-ffmpeg-static-all.lib .\alpha-ffmpeg-static.lib ..\..\libffmpeg\lib\x64\libavcodec.lib ..\..\libffmpeg\lib\x64\libavformat.lib ..\..\libffmpeg\lib\x64\libavutil.lib ..\..\libffmpeg\lib\x64\libswresample.lib ..\..\libffmpeg\lib\x64\libswscale.lib
```

## 去构建`ffmpeg-static-exe`