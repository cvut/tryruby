# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'try_ruby_cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'try_ruby_cli'
  spec.version       = Tryruby::VERSION
  spec.authors       = ['Jakub Červenka', 'Tomas Barton']
  spec.email         = ['cervej19@fit.cvut.cz', 'tomas.barton@fit.cvut.cz']
  spec.summary       = 'Console version of tryruby.org'
  spec.description   = 'Console tutorial tool for Ruby.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'ripl'
  spec.add_dependency 'ripl-multi_line'
  spec.add_dependency 'sourcify'
  spec.add_dependency 'paint'
end
