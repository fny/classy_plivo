# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'classy_plivo/version'

Gem::Specification.new do |spec|
  spec.name          = 'classy_plivo'
  spec.version       = ClassyPlivo::VERSION
  spec.authors       = ['Faraz Yashar']
  spec.email         = ['faraz.yashar@gmail.com']

  spec.summary       = 'A classy wrapper for the Plivo Ruby library'
  spec.description   = 'A minimalistic and classy wrapper for the Plivo Ruby library.'
  spec.homepage      = 'https://github.com/fny/classy_plivo'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'plivo', '~> 0.3.16'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'minitest', '~> 5.6'
  spec.add_development_dependency 'rake', '~> 10.0'
end
