# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'state_run_media/version'

Gem::Specification.new do |spec|
  spec.name          = "state_run_media"
  spec.version       = StateRunMedia::VERSION
  spec.authors       = ["Ryan Platte"]
  spec.email         = ["rep@usertesting.com"]
  spec.description   = %q{Automatically publish events upon state transitions. All you have to do is subscribe.}
  spec.summary       = %q{Publish state news}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "state_machine", "~> 1.2.0"
  spec.add_dependency "wisper", "~> 1.2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
