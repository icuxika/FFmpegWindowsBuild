# Windows静态链接FFmpeg构建exe

> 需要先完成`ffmpeg-static-lib`的构建

## 拷贝`ffmpeg-static-lib`生成的静态库到`lib`目录
```
cp ..\ffmpeg-static-lib\build\Release\alpha-ffmpeg-static-all.lib .\lib\
```

## 构建
```
cmake -S . -B build
cmake --build .\build\ --config Release
```

## 分析生成的exe
> 大小：`3.60 MB`

程序动态库依赖`dumpbin.exe /dependents .\build\Release\FFmpegStaticExe.exe`
```
Microsoft (R) COFF/PE Dumper Version 14.36.32545.0
Copyright (C) Microsoft Corporation.  All rights reserved.


Dump of file .\build\Release\FFmpegStaticExe.exe

File Type: EXECUTABLE IMAGE

  Image has the following dependencies:

    WS2_32.dll
    bcrypt.dll
    KERNEL32.dll
    USER32.dll
    MSVCP140.dll
    VCRUNTIME140.dll
    VCRUNTIME140_1.dll
    api-ms-win-crt-runtime-l1-1-0.dll
    api-ms-win-crt-stdio-l1-1-0.dll
    api-ms-win-crt-convert-l1-1-0.dll
    api-ms-win-crt-utility-l1-1-0.dll
    api-ms-win-crt-math-l1-1-0.dll
    api-ms-win-crt-string-l1-1-0.dll
    api-ms-win-crt-time-l1-1-0.dll
    api-ms-win-crt-environment-l1-1-0.dll
    api-ms-win-crt-heap-l1-1-0.dll
    api-ms-win-crt-locale-l1-1-0.dll
    api-ms-win-crt-filesystem-l1-1-0.dll

  Summary

     1063000 .data
        E000 .pdata
      144000 .rdata
        3000 .reloc
        1000 .rsrc
      246000 .text
```

## 执行程序
```
.\build\Release\FFmpegStaticExe.exe
```
正常执行的日志
```
[av::AlphaAVCore::openFile] 打开文件
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'C:\Users\icuxika\Desktop\test.mp4':
  Metadata:
    major_brand     : mp42
    minor_version   : 0
    compatible_brands: isommp42
    creation_time   : 2022-11-13T08:42:03.000000Z
    date            : 2022
  Duration: 00:00:25.47, start: 0.000000, bitrate: 44778 kb/s
  Stream #0:0[0x1](und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv, smpte170m, progressive), 2560x1440 [SAR 1:1 DAR 16:9], 44590 kb/s, 60 fps, 60 tbr, 90k tbn (default)
    Metadata:
      creation_time   : 2022-11-13T08:42:03.000000Z
      handler_name    : VideoHandle
      vendor_id       : [0][0][0][0]
  Stream #0:1[0x2](und): Audio: aac (LC) (mp4a / 0x6134706D), 48000 Hz, stereo, fltp, 191 kb/s (default)
    Metadata:
      creation_time   : 2022-11-13T08:42:03.000000Z
      handler_name    : SoundHandle
      vendor_id       : [0][0][0][0]
[av::AlphaAVDemux::openFile] ------------------------------------------------------
[av::AlphaAVDemux::openFile] 视频总时长（毫秒）25472
[av::AlphaAVDemux::openFile] 视频总时长（秒）25
[av::AlphaAVCore::openFile] 检查硬件解码支持
[av::AlphaAVDecode::enableHwDeviceSupport] 硬件解码使用 cuda
[av::AlphaAVCore::openFile] 打开视频解码器
[av::AlphaAVDecode::openVideoCodecContext] ------------------------------------------------------
[av::AlphaAVDecode::openVideoCodecContext] 视频宽度2560
[av::AlphaAVDecode::openVideoCodecContext] 视频高度1440
[av::AlphaAVDecode::openVideoCodecContext] 视频像素格式yuv420p
[av::AlphaAVDecode::openVideoCodecContext] 视频帧速率60
[av::AlphaAVCore::openFile] 打开音频解码器
[av::AlphaAVCore::play] 开始解码
[av::AlphaAVDecode::outputVideoFrame] (pts: -9223372036854775808)->(nv12)->[2560,1440] linesize1: 2560 linesize2: 2560 linesize3: 0
```