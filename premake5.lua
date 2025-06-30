workspace "NVIDIA_SDKs"
    architecture "x86_64"
    configurations { "Debug", "Release" }

    include "NVIDIAImageScaling"

project "DLSS"
    kind "None"
    language "C++"

    includedirs { "%{prj.location}/include" }
    libdirs { "%{prj.location}/lib/Windows_x86_64/x64" }

    files {
        "%{prj.location}/include/**.h",
        "%{prj.location}/lib/Windows_x86_64/x64/**.lib",
        "%{prj.location}/lib/Windows_x86_64/rel/**.dll"
    }

    links { "NVIDIAImageScaling" }

    filter "configurations:Debug"
        links { "nvsdk_ngx_d" }

    filter "configurations:Release"
        links { "nvsdk_ngx_s" }