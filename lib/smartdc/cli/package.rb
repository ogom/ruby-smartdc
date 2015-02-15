module Smartdc::Cli
  class Package < Thor
    include Smartdc::CliHelper

    desc 'list', 'Provides a list of packages available in this datacenter.'
    def list
      output Smartdc.packages, options.merge(table: :horizontal, include: %i[
        id name version memory disk vcpus group
      ])
    end

    desc 'show [NAME]', 'Gets a package by name or id.'
    def show(name)
      output Smartdc.package(name), options.merge(table: :vertical)
    end
  end
end
