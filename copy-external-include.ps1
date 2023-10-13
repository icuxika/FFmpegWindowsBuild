if (!(Test-Path -Path msvc\include\gl)) {
    New-Item -ItemType Directory -Path msvc\include\gl
}
Copy-Item .\other\OpenGL-Registry\api\GL\glext.h .\msvc\include\gl\
Copy-Item .\other\OpenGL-Registry\api\GL\wglext.h .\msvc\include\gl\

if (!(Test-Path -Path msvc\include\KHR)) {
    New-Item -ItemType Directory -Path msvc\include\KHR
}
Copy-Item .\other\EGL-Registry\api\KHR\* .\msvc\include\KHR\

if (!(Test-Path -Path msvc\include\ffnvcodec)) {
    New-Item -ItemType Directory -Path msvc\include\ffnvcodec
}
Copy-Item .\other\nv-codec-headers\include\ffnvcodec\* .\msvc\include\ffnvcodec\

if (!(Test-Path -Path msvc\include\AMF)) {
    New-Item -ItemType Directory -Path msvc\include\AMF
}
Copy-Item -Recurse .\other\AMF\amf\public\include\* .\msvc\include\AMF\