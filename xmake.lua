includes("build_proj.lua")
_config_project({
	project_name = "eastl",
	project_kind = "shared",
	batch_size = 64,
	no_rtti = true
})
local add_includedirs = _get_add_includedirs()
local add_defines = _get_add_defines()
add_includedirs("include/", "packages/EABase/include/Common", {
	public = true
})

add_defines("EA_PRAGMA_ONCE_SUPPORTED", "EASTL_ASSERT_ENABLED=0", "EA_HAVE_CPP11_CONTAINERS", "EA_HAVE_CPP11_ATOMIC", "EA_HAVE_CPP11_CONDITION_VARIABLE",
				"EA_HAVE_CPP11_MUTEX", "EA_HAVE_CPP11_THREAD", "EA_HAVE_CPP11_FUTURE", "EA_HAVE_CPP11_TYPE_TRAITS",
				"EA_HAVE_CPP11_TUPLES", "EA_HAVE_CPP11_REGEX", "EA_HAVE_CPP11_RANDOM", "EA_HAVE_CPP11_CHRONO",
				"EA_HAVE_CPP11_SCOPED_ALLOCATOR", "EA_HAVE_CPP11_INITIALIZER_LIST", "EA_HAVE_CPP11_SYSTEM_ERROR",
				"EA_HAVE_CPP11_TYPEINDEX", "EASTL_STD_ITERATOR_CATEGORY_ENABLED", "EASTL_STD_TYPE_TRAITS_AVAILABLE",
				"EASTL_MOVE_SEMANTICS_ENABLED", "EASTL_VARIADIC_TEMPLATES_ENABLED", "EASTL_VARIABLE_TEMPLATES_ENABLED",
				"EASTL_INLINE_VARIABLE_ENABLED", "EASTL_HAVE_CPP11_TYPE_TRAITS", "EASTL_INLINE_NAMESPACES_ENABLED",
				"EASTL_ALLOCATOR_EXPLICIT_ENABLED", "EA_DLL", "EASTL_USER_DEFINED_ALLOCATOR", {
					public = true
				})
if _get_or("enable_rtti", false) then
	add_defines("EASTL_RTTI_ENABLED")
end
add_files("source/*.cpp")
add_defines("LC_EASTL_EXPORT=1", "EASTL_PROJECT=1")
if _get_or("use_mimalloc", true) or is_plat("windows") then
	add_defines("EASTL_MIMALLOC_ENABLED=1")
	includes("packages/mimalloc")
	add_deps("mimalloc")
end