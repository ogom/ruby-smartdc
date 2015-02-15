require 'smartdc/version'
require 'smartdc/configure'
require 'smartdc/default'
require 'smartdc/client'

module Smartdc
  class << self
    def configure
      yield Smartdc::Configure
    end

    def config
      Smartdc::Configure
    end

    def client(options={})
      @client = nil unless options.empty?
      @client ||= Smartdc::Client.new(options)
    end

    def root
      @root ||= File.expand_path('..', File.dirname(__FILE__))
    end

    def method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end
  end
end

Smartdc::Configure.setup
