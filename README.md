# smartdc

ruby-smartdc is a ruby client library for interacting with the Joyent SmartDataCenter CloudApi. 


## Installation

    gem install smartdc


## Usage

### CLI

    sdc-setup

[Slid](http://www.slideshare.net/ogom_/smartdc-by-ruby-10047222) the command.


### Program

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