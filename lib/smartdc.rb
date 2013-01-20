require 'smartdc/version'
require 'smartdc/client'
require 'smartdc/request'
require 'smartdc/response'
require 'smartdc/error'

module Smartdc
  def self.new(options={})
    Smartdc::Client.new(options)
  end

  def self.config=(options={})
    @cli = Smartdc::Client.new(options)
    @config = options
  end

  def self.config
    @config
  end

  def self.cli
    @cli
  end
end
