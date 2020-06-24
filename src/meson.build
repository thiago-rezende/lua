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

lua_warns = [
    '-fmax-errors=5',
	'-Wextra',
	'-Wshadow',
	'-Wsign-compare',
	'-Wundef',
	'-Wwrite-strings',
	'-Wredundant-decls',
	'-Wdisabled-optimization',
	'-Wdouble-promotion',
	'-Wlogical-op',
	'-Wno-aggressive-loop-optimizations',
    '-Wdeclaration-after-statement',
	'-Wmissing-prototypes',
	'-Wnested-externs',
	'-Wstrict-prototypes',
	'-Wc++-compat',
	'-Wold-style-definition',
    ## the next warnings might be useful sometimes,
	## but usually they generate too much noise
	# '-Werror',
	# '-pedantic', # warns if we use jump tables
	# '-Wconversion ',
	# '-Wsign-conversion',
	# '-Wstrict-overflow=2',
	# '-Wformat=2',
	# '-Wcast-qual'
]

lua_flags = [
    '-Wall',
    '-O2',
    '-fno-stack-protector',
    '-fno-common',
    '-march=native'
]

if get_option('library_type') == 'static'
    liblua = static_library('lua',
        c_args: [lua_warns, lua_flags],
        dependencies: [m_dep],
        sources: [luacore_src, liblua_src, luaaux_src],
        include_directories: lua_inc,
        install: true)
else
    liblua = shared_library('lua',
        c_args: [lua_warns, lua_flags],
        dependencies: [m_dep],
        sources: [luacore_src, liblua_src, luaaux_src],
        include_directories: lua_inc,
        install: true)
endif

liblua_dep = declare_dependency(link_with : liblua,
    include_directories : lua_inc)

if get_option('build_interpreter').enabled()
    lua = executable('lua',
        dependencies: [liblua_dep, m_dep],
        sources: [lua_src, luacore_src],
        include_directories: lua_inc,
        install: true)
endif
