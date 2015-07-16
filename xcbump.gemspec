# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcbump/version'

Gem::Specification.new do |spec|
  spec.name          = 'xcbump'
  spec.version       = Xcbump::VERSION
  spec.authors       = ['Andrew Katz']
  spec.email         = ['andrew@greenbits.com']
  spec.summary       = %q{Xcbump}
  spec.description   = %q{Increments the version and build numbers for an Xcode project.}
  spec.homepage      = 'https://github.com/greenbits/xcbump'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'slop', '~> 4.0.0'
  spec.add_dependency 'plist', '~> 3.1.0'
  spec.add_dependency 'highline', '~> 1.7.2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
