if (Test-Path -Path out) {
    Remove-Item -Recurse -Force -Path out
}
New-Item -ItemType Directory -Path out

Get-ChildItem -Path .\msvc\include\ | Where-Object { $_.Name -match "libavcodec|libavdevice|libavfilter|libavformat|libavutil|libpostproc|libswresample|libswscale" } | ForEach-Object { Copy-Item -Recurse -Path $_.FullName -Destination (New-Item -Type Directory -Force .\out\include) }

New-Item -ItemType Directory -Path .\out\lib\x64

Get-ChildItem -Path .\msvc\lib\x64\ -Filter "*.lib" | Where-Object { $_.Name -match "libavcodec\.lib|libavdevice\.lib|libavfilter\.lib|libavformat\.lib|libavutil\.lib|libpostproc\.lib|libswresample\.lib|libswscale\.lib" } | ForEach-Object { Copy-Item -Path $_.FullName -Destination .\out\lib\x64 }
Get-ChildItem -Path .\msvc\lib\x64\ | Where-Object { $_.Name -match "(avcodec|avdevice|avfilter|avformat|avutil|postproc|swresample|swscale).*[d]\.(lib|pdb)$" } | ForEach-Object { Copy-Item -Path $_.FullName -Destination .\out\lib\x64 }

$Name = ".\out\" + (Get-Content .\source\FFmpeg\RELEASE) + "_static_simple_msvc_x64_" + (Get-Date -Format "yyyy-MM-dd") + ".zip"

Compress-Archive -Path .\out\* -DestinationPath $Name