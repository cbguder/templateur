# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'templateur'
  spec.version       = '0.1.0'
  spec.authors       = ['Can Berk Güder']
  spec.email         = ['cbguder@gmail.com']
  spec.summary       = 'Lightweight templates for YAML and JSON'
  spec.homepage      = 'https://github.com/cbguder/templateur'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/).grep(%r{^(bin|lib)/})
  spec.executables   = ['templateur']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
