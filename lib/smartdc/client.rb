require 'smartdc/api/keys'
require 'smartdc/api/datacenters'
require 'smartdc/api/datasets'
require 'smartdc/api/packages'
require 'smartdc/api/machines'
require 'smartdc/api/analytics'

module Smartdc
  class Client
    attr_reader :options

    def initialize(options={})
      @options ||= options
    end

    def keys()
      Smartdc::Api::Keys.new(options)
    end

    def datacenters()
      Smartdc::Api::Datacenters.new(options)
    end

    def datasets()
      Smartdc::Api::Datasets.new(options)
    end

    def packages()
      Smartdc::Api::Packages.new(options)
    end

    def machines()
    	Smartdc::Api::Machines.new(options)
    end

    def analytics()
      Smartdc::Api::Analytics.new(options)
    end
  end
end
