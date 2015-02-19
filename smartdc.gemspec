# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smartdc/version'

Gem::Specification.new do |spec|
  spec.name          = "smartdc"
  spec.version       = Smartdc::VERSION
  spec.authors       = ["ogom"]
  spec.email         = ["ogom@hotmail.co.jp"]
  spec.summary       = %q{Joyent CloudAPI client by Ruby.}
  spec.description   = %q{Joyent CloudAPI client and command line interface.}
  spec.homepage      = "http://github.com/ogom/ruby-smartdc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'cassette-rack', '~> 0.7'
  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'terminal-table', '~> 1.4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
