# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "smartdc"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ogom"]
  s.date = "2011-11-19"
  s.description = "smartdc is SmartDataCenter Public API."
  s.email = "ogom@hotmail.co.jp"
  s.executables = ["sdc-addmachinetag", "sdc-createkey", "sdc-createmachine", "sdc-deletekey", "sdc-deletemachine", "sdc-deletemachinetag", "sdc-getdatacenter", "sdc-getdataset", "sdc-getkey", "sdc-getmachine", "sdc-getmachinetag", "sdc-getpackage", "sdc-listdatacenters", "sdc-listdatasets", "sdc-listkeys", "sdc-listmachines", "sdc-listmachinetags", "sdc-listpackages", "sdc-rebootmachine", "sdc-resizemachine", "sdc-setup", "sdc-startmachine", "sdc-stopmachine"]
  s.extra_rdoc_files = [
    "LICENSE.md",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.md",
    "README.md",
    "VERSION",
    "bin/sdc-addmachinetag",
    "bin/sdc-createkey",
    "bin/sdc-createmachine",
    "bin/sdc-deletekey",
    "bin/sdc-deletemachine",
    "bin/sdc-deletemachinetag",
    "bin/sdc-getdatacenter",
    "bin/sdc-getdataset",
    "bin/sdc-getkey",
    "bin/sdc-getmachine",
    "bin/sdc-getmachinetag",
    "bin/sdc-getpackage",
    "bin/sdc-listdatacenters",
    "bin/sdc-listdatasets",
    "bin/sdc-listkeys",
    "bin/sdc-listmachines",
    "bin/sdc-listmachinetags",
    "bin/sdc-listpackages",
    "bin/sdc-rebootmachine",
    "bin/sdc-resizemachine",
    "bin/sdc-setup",
    "bin/sdc-startmachine",
    "bin/sdc-stopmachine",
    "config/fixtures/key.json",
    "lib/cli_helper.rb",
    "lib/faraday/response/mashify.rb",
    "lib/faraday/response/parse_json.rb",
    "lib/smartdc.rb",
    "lib/smartdc/api/datacenters.rb",
    "lib/smartdc/api/datasets.rb",
    "lib/smartdc/api/keys.rb",
    "lib/smartdc/api/machine_tags.rb",
    "lib/smartdc/api/machines.rb",
    "lib/smartdc/api/packages.rb",
    "lib/smartdc/client.rb",
    "lib/smartdc/request.rb",
    "smartdc.gemspec",
    "spec/smartdc/api/datacenters_spec.rb",
    "spec/smartdc/api/datasets_spec.rb",
    "spec/smartdc/api/keys_spec.rb",
    "spec/smartdc/api/machines_spec.rb",
    "spec/smartdc/api/packages_spec.rb",
    "spec/smartdc/client_spec.rb",
    "spec/smartdc/request_spec.rb",
    "spec/smartdc_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/ogom/ruby-smartdc"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "SmartDataCenter CloudApi client by ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, ["~> 0.7.5"])
      s.add_runtime_dependency(%q<hashie>, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0.3"])
      s.add_runtime_dependency(%q<multipart-post>, ["~> 1.1.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<uuid>, ["~> 2.3.4"])
    else
      s.add_dependency(%q<faraday>, ["~> 0.7.5"])
      s.add_dependency(%q<hashie>, ["~> 1.2.0"])
      s.add_dependency(%q<multi_json>, ["~> 1.0.3"])
      s.add_dependency(%q<multipart-post>, ["~> 1.1.3"])
      s.add_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<uuid>, ["~> 2.3.4"])
    end
  else
    s.add_dependency(%q<faraday>, ["~> 0.7.5"])
    s.add_dependency(%q<hashie>, ["~> 1.2.0"])
    s.add_dependency(%q<multi_json>, ["~> 1.0.3"])
    s.add_dependency(%q<multipart-post>, ["~> 1.1.3"])
    s.add_dependency(%q<rspec>, ["~> 2.7.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<uuid>, ["~> 2.3.4"])
  end
end

