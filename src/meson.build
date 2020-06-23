luacore_src = [
    'lapi.c',
    'lcode.c',
    'lctype.c',
    'ldebug.c',
    'ldo.c',
    'ldump.c',
    'lfunc.c',
    'lgc.c',
    'llex.c',
    'lmem.c',
    'lobject.c',
    'lopcodes.c',
    'lparser.c',
    'lstate.c',
    'lstring.c',
    'ltable.c',
    'ltm.c',
    'lundump.c',
    'lvm.c',
    'lzio.c',
    'ltests.c'
]

luaaux_src = [
    'lauxlib.c'
]

liblua_src = [
    'lbaselib.c',
    'ldblib.c',
    'liolib.c',
    'lmathlib.c',
    'loslib.c',
    'ltablib.c',
    'lstrlib.c',
	'lutf8lib.c',
    'loadlib.c',
    'lcorolib.c',
    'linit.c'
]

lua_src = [
    'lua.c'
]

if get_option('library_type') == 'static'
    liblua = static_library('liblua',
        sources: [luacore_src, luaaux_src, luaaux_src],
        include_directories: lua_inc,
        install: true)
else
    liblua = shared_library('liblua',
        sources: [luacore_src, luaaux_src, luaaux_src],
        include_directories: lua_inc,
        install: true)
endif

liblua_dep = declare_dependency(link_with : liblua,
    include_directories : lua_inc)

if get_option('build_interpreter').enabled()
    lua = executable('lua',
        dependencies: liblua_dep,
        sources: [lua_src, luacore_src, liblua_src],
        include_directories: lua_inc,
        install: true)
endif
