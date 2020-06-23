tests_src = {
    'simple': ['src/simple.c']
}

tests_inc = include_directories(['include'])

if get_option('build_tests').enabled()
    foreach name, sources : tests_src
        test(name, executable(name,
            dependencies: liblua_dep,
            sources: sources,
            include_directories: tests_inc,
            install: false))
    endforeach
endif
