require 'smartdc/client'
require 'smartdc/request'

module Smartdc
  def self.new(options={})
    Smartdc::Client.new(options)
  end
end