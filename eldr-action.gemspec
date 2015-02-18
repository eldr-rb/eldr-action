# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eldr/action/version'

Gem::Specification.new do |spec|
  spec.name          = "eldr-action"
  spec.version       = Eldr::Action::VERSION
  spec.authors       = ["K-2052"]
  spec.email         = ["k@2052.me"]
  spec.summary       = %q{A simple action object for Eldr}
  spec.homepage      = "https://github.com/eldr-rb/eldr-action"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'eldr',        '~> 0.0'
  spec.add_dependency 'activemodel', '~> 4.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
