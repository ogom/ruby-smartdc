#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'pp'
require 'smartdc'

def fixture(name)
  json = File.read(File.join(File.dirname(__FILE__), "fixtures/#{name}.json"))
  MultiJson.decode(json)
end

def client
  @client ||= Smartdc.new(fixture('config'))
end