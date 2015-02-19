require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'doc']
end

task test: :spec
task default: :spec

require 'cassette-rack'

namespace :vcr do
  desc "Draw cassettes of VCR"
  task :draw do
    CassetteRack.configure do |config|
      config.content_layout =  File.join(File.dirname(__FILE__), 'doc/caracal/content.md.liquid')
    end

    path = ENV['path'] ||= File.join(File.dirname(__FILE__), 'doc/cassettes')
    CassetteRack::Cli.draw(path)
    puts "drawing cassettes to #{path}"
  end
end
