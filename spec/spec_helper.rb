require 'smartdc'
require 'smartdc/cli'
require 'vcr'

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/cassettes'
  config.allow_http_connections_when_no_cassette = true
  config.default_cassette_options = { record: ENV.fetch('VCR'){ :once }.to_sym }
  config.configure_rspec_metadata!

  config.filter_sensitive_data("<USERNAME>") { Smartdc.config.username }

  config.before_record do |interaction|
    interaction.request.headers['Authorization'] = ''
    interaction.request.headers['Date'] = ''

    interaction.response.headers['Date'] = ''
    interaction.response.headers['Request-Id'] = ''
    interaction.response.headers['X-Request-Id'] = ''
    interaction.response.headers['Response-Time'] = ''
    interaction.response.headers['X-Response-Time'] = ''

    interaction.response.body.force_encoding 'UTF-8'
  end
end
