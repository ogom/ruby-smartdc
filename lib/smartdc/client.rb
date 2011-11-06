require 'smartdc/api/keys'
require 'smartdc/api/datacenters'
require 'smartdc/api/datasets'
require 'smartdc/api/packages'
require 'smartdc/api/machines'
#require 'smartdc/api/analytics'

module Smartdc
  class Client
  	attr_reader :request

  	def initialize(options={})
      @request = Smartdc::Request.new(options)
    end

    def keys
      @keys ||= Smartdc::Api::Keys.new(request)
    end

    def datacenters
      @datacenters ||= Smartdc::Api::Datacenters.new(request)
    end

    def datasets
      @datasets ||= Smartdc::Api::Datasets.new(request)
    end

    def packages
      @packages ||= Smartdc::Api::Packages.new(request)
    end

    def machines
    	@machines ||= Smartdc::Api::Machines.new(request)
    end
  end
end