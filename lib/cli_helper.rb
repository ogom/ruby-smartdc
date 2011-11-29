require 'pp'
require "optparse"
require 'smartdc'

def fixture(name, path='config/fixtures')
  json = File.read(File.join(File.dirname(__FILE__), '..', path, "/#{name}.json"))
  MultiJson.decode(json)
end

def client(middleware=nil)
  @client ||= Smartdc.new(fixture('config', 'config'), middleware)
end