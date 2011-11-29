require 'smartdc/client'
require 'smartdc/request'

module Smartdc
  def self.new(options={}, middleware=nil)
    Smartdc::Client.new(options, middleware)
  end
end