require 'smartdc/api/keys'
require 'smartdc/api/datacenters'
require 'smartdc/api/datasets'
require 'smartdc/api/packages'
require 'smartdc/api/machines'
require 'smartdc/api/analytics'

module Smartdc
  class Client
    attr_reader :request

    def initialize(options={})
      @request ||= Smartdc::Request.new(options)
    end

    def format=(format)
      @request.format = format
    end

    def keys(id=nil)
      Smartdc::Api::Keys.new(request, id)
    end

    def datacenters(id=nil)
      Smartdc::Api::Datacenters.new(request, id)
    end

    def datasets(id=nil)
      Smartdc::Api::Datasets.new(request, id)
    end

    def packages(id=nil)
      Smartdc::Api::Packages.new(request, id)
    end

    def machines(id=nil)
    	Smartdc::Api::Machines.new(request, id)
    end

    def analytics(id=nil)
      Smartdc::Api::Analytics.new(request, id)
    end
  end
end