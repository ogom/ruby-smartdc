$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'cli_helper'

def fixture(name)
  path = File.join(File.dirname(__FILE__), './fixtures', "/#{name}.json")
  JSON.parse(File.read(path))
end
