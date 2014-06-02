# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zvents/version'

Gem::Specification.new do |spec|
  spec.name          = "zvents"
  spec.version       = Zvents::VERSION
  spec.authors       = ["Austin Fonacier"]
  spec.email         = ["austinrf@gmail.com"]
  spec.summary       = "Ruby wrapper for the Zvents API"
  spec.description   = "Ruby wrapper for the Zvents API"
  spec.homepage      = "http://github.com/austinrfnd/zvents"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 3.0.0.beta2'
  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.add_dependency 'virtus', '~> 1.0.2'
  spec.add_dependency 'faraday_middleware'
end
