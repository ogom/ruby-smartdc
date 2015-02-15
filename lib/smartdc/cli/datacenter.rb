module Smartdc::Cli
  class Datacenter < Thor
    include Smartdc::CliHelper

    desc 'list', 'Provides a list of all datacenters this cloud is aware of.'
    def list
      output Smartdc.datacenters, options.merge(table: :vertical)
    end

    desc 'show [NAME]', 'Gets an individual datacenter by name.'
    def show(name)
      output Smartdc.datacenter(name)
    end
  end
end
