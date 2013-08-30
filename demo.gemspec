version = '0.0.1'

Gem::Specification.new do |s|

  s.name = 'demo'
  s.version = version

  s.author = 'Bruno Oliveira, Martin Bosslet'
  s.email = 'bruno@abstractj.org'
  s.homepage = 'https://github.com/abstractj/krypt-demo'
  s.summary = 'Platform- and library-independent cryptography for Ruby'
  s.description = 'krypt provides a unified framework for Ruby cryptography by offering a platform- and library-independent provider mechanism.'

  s.required_ruby_version     = '>= 2.0.0'

  s.files = Dir.glob('{lib,spec,test}/**/*')
  s.files += ['LICENSE']
  s.test_files = Dir.glob('test/**/test_*.rb')
  s.extra_rdoc_files = [ "README.md" ]
  s.require_path = "lib"
  s.license = 'MIT'

  s.add_dependency 'ffi'
  s.add_dependency 'krypt-core', version

end