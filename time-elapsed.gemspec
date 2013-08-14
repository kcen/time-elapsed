# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time/elapsed/version'

Gem::Specification.new do |spec|
  spec.name          = 'time-elapsed'
  spec.version       = Time::Elapsed::VERSION
  spec.authors       = ['kcen']
  spec.description   = %q{Adds elapsed time functionality to rubys time}
  spec.summary       = %q{Adds elapsed time functionality to rubys time}
  spec.homepage      = 'https://github.com/kcen/time-elapsed'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
