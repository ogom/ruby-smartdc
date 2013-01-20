# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smartdc/version'

Gem::Specification.new do |gem|
  gem.name          = "smartdc"
  gem.version       = Smartdc::VERSION
  gem.authors       = ["ogom"]
  gem.email         = ["ogom@hotmail.co.jp"]
  gem.description   = %q{SmartDataCenter client and SmartDataCenter Command Line Interface.}
  gem.summary       = %q{Joyent SmartDataCenter CloudApi client by ruby.}
  gem.homepage      = "http://github.com/ogom/ruby-smartdc"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency(%q<faraday>, ["~> 0.8"])
  gem.add_runtime_dependency(%q<thor>, ["~> 0.16"])
  gem.add_runtime_dependency(%q<terminal-table>, ["~> 1.4"])
  gem.add_development_dependency(%q<bundler>, ["~> 1.1"])
  gem.add_development_dependency(%q<jeweler>, ["~> 1.8"])
  gem.add_development_dependency(%q<rspec>, ["~> 2.12"])
end
