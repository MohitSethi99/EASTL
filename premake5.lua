project "eastl"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	defines
	{
		"_CHAR16T",
		"_CRT_SECURE_NO_WARNINGS",
		"_SCL_SECURE_NO_WARNINGS",
		"EASTL_OPENSOURCE=1"
	}

	files
	{
		"include/**.h",
		"source/**.cpp"
	}

	includedirs
	{
		"include",
		"test/packages/EAAssert/include",
		"test/packages/EABase/include/Common",
		"test/packages/EAMain/include",
		"test/packages/EAStdC/include",
		"test/packages/EATest/include",
		"test/packages/EAThread/include"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
