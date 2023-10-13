# ShiftMediaProject FFmpeg

参考教程：[vs2019 编译 ffmpeg 源码为静态库动态库【完整步骤、亲测可行】](http://t.csdnimg.cn/6FLT5)

### 未编译时的目录结构

```
├───msvc
│   └───include
│       ├───AMF
│       ├───ffnvcodec
│       ├───gl
│       └───KHR
├───source
│   ├───FFmpeg
│   ├───dependency project1
│   └───dependency project2
├───other
│   ├───AMF
│   ├───EGL-Registry
│   ├───nv-codec-headers
│   └───OpenGL-Registry
```

### 拉取 ShiftMediaProject FFmpeg 并下载依赖的项目（如 libx264 等）到 source 目录下，依赖项目与 FFmpeg 项目同级

```
mkdir source
cd .\source\
git clone https://github.com/ShiftMediaProject/FFmpeg.git
cd .\FFmpeg\SMP\
.\project_get_dependencies.bat
```

### 一些额外的依赖项下载到 other 目录并拷贝[readme.txt](https://github.com/ShiftMediaProject/FFmpeg/blob/master/SMP/readme.txt)所要求的 include 文件到指定目录下

```
mkdir other
cd .\other\
git clone https://github.com/KhronosGroup/OpenGL-Registry.git
git clone https://github.com/KhronosGroup/EGL-Registry.git
git clone https://github.com/FFmpeg/nv-codec-headers.git
git clone https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git
cd ..
.\copy-external-include.ps1
```

### 安装 `nasm.exe`和`yasm.exe` 到项目要求的指定目录`$env:VCINSTALLDIR`

> 在 Visual Studio 提供的命令行环境中运行（管理员模式）

> Visual Studio 2022 `$env:VCINSTALLDIR`值为`C:\Program Files\Microsoft Visual Studio\2022\Community\VC\`

> `项目提供的脚本有可能会遇到些小问题导致没有下载，需要自行看情况修改`

#### 或许需要设置代理

```
$env:HTTP_PROXY = "http://127.0.0.1:7890"
$env:HTTPS_PROXY = "http://127.0.0.1:7890"
```

#### 下载`nasm.exe`并安装

```
git clone https://github.com/ShiftMediaProject/VSNASM
cd .\VSNASM\
.\install_script.bat
```

#### 下载`yasm.exe`并安装

```
git clone https://github.com/ShiftMediaProject/VSYASM
cd .\VSYASM\
.\install_script.bat
```

### 开始编译

在 VS 中打开 source\FFmpeg\SMP\ffmpeg_deps.sln，根据需要选择 静态库/动态库/x64/x86/Debug/Release 版本

> 遇到以下错误的话，再点一下`重新生成解决方案就可以了`

`严重性	代码	说明	项目	文件	行	禁止显示状态
错误	C1083	无法打开包括文件: “gcrypt.h”: No such file or directory	libavutil	C:\Users\icuxika\VSCodeProjects\FFmpegWindowsBuild\source\FFmpeg\libavutil\random_seed.c	34	
`
