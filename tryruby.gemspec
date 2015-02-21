# coding: utf-8
require File.expand_path('../lib/tryruby/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'tryruby'
  spec.version       = Tryruby::VERSION
  spec.authors       = ['Jakub Červenka', 'Tomas Barton']
  spec.email         = ['cervej19@fit.cvut.cz', 'tomas.barton@fit.cvut.cz']
  spec.summary       = 'Console version of tryruby.org'
  spec.description   = 'Console tutorial tool for Ruby.'
  spec.homepage      = 'https://github.com/cvut/tryruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_runtime_dependency 'ripl', '~> 0.7'
  spec.add_runtime_dependency 'ripl-multi_line', '~> 0.3'
  spec.add_runtime_dependency 'sourcify', '~> 0.5'
  spec.add_runtime_dependency 'paint', '~> 0.9'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'simplecov', '~> 0.9'
end
