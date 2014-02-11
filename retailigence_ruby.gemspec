# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'retailigence/version'

Gem::Specification.new do |spec|
  spec.name          = "retailigence_ruby"
  spec.version       = RetailigenceRuby::VERSION
  spec.authors       = ["Drew Tempelmeyer"]
  spec.email         = ["drewtemp@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'vcr', '>= 2.6.0'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'typhoeus', '<= 0.7.0'
end