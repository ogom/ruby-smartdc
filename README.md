# smartdc

SmartDataCenter CloudApi client by ruby.

smartdc is SmartDataCenter Public API.


## Usage

  require 'smartdc'

  config = {
    "url"      => "https://example.com/",
    "version"  => "~6.5",
    "username" => "auth_user",
    "password" => "auth_pass"
  }

  client = Smartdc.new(config)
  machines = client.machines.find
  machines.each do |machine|
    puts machine.id
  end


## Copyright

Copyright (c) 2011 ogom. See LICENSE.md for further details.