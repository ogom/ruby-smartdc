require 'smartdc/client'
require 'smartdc/request'
require 'smartdc/error'

module Smartdc
  def self.new(options={})
    Smartdc::Client.new(options)
  end
end