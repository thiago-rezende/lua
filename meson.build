project('lua',
  ['c'],
  version : '5.4.0',
  license: 'MIT',
  default_options : ['c_std=c99'])

lua_inc = include_directories('include')

cc = meson.get_compiler('c')
m_dep = cc.find_library('m', required : false)

subdir('src')
subdir('tests')

summary({'bindir': get_option('bindir'),
         'libdir': get_option('libdir'),
         'datadir': get_option('datadir'),
        }, section: 'Directories')

summary({'Library Type': get_option('library_type'),
         'Build Interpreter': get_option('build_interpreter').enabled(),
         'Build Tests': get_option('build_tests').enabled()
        }, section: 'Configuration')
