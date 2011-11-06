$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'uuid'
require 'smartdc'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
end

def fixture(name)
  json = File.read(File.join(File.dirname(__FILE__), "/fixtures/#{name}.json"))
  MultiJson.decode(json)
end

def client
  @client ||= Smartdc.new(fixture('config'))
end