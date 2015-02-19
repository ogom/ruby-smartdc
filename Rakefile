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
    root_path = File.dirname(__FILE__)
    CassetteRack.configure do |config|
      config.content_layout =  File.join(root_path, 'doc/caracal/content.md.liquid')
    end

    dest_path = ENV['path'] ||= File.join(root_path, 'doc/cassettes')
    CassetteRack::Cli.draw(dest_path)
    puts "drawing cassettes to #{dest_path}"
  end
end
