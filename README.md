# smartdc

ruby-smartdc is a ruby client library for interacting with the Joyent SmartDataCenter CloudApi. 


## Installation

    gem install smartdc


## Usage

[Using slides.](http://www.slideshare.net/ogom_/smartdc-by-ruby-10047222)


### CLI

    $ sdc-setup https://example.com
    version:[~6.5] 
    Username (login): auth_user
    Password: auth_pass
    Successful configuration.

    $ sdc-listdatacenters 
    {
      "example": "https://example.com"
    }


### Program

Connect and Machine find.

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
      puts "machines   id: #{machine.id}, state: #{machine.state}"
      machine = client.machines(machine.id)
      
      puts 'Stop the machine.'
      machine.stop
      8.times do |i|
        puts "machine(#{i}) id: #{machine.read.id}, state: #{machine.read.state}"
        break if machine.read.state == 'stopped'
        sleep i
      end
      
      puts 'Start the machine.'
      machine.start
      8.times do |i|
        puts "machine(#{i}) id: #{machine.read.id}, state: #{machine.read.state}"
        break if machine.read.state == 'running'
        sleep i
      end
      puts
    end


Return type of the variable.

    client = Smartdc.new(config)
    
    # Type of a variable to mash. (Default)
    client.request.return_variable = 'mash'
    puts client.datacenters.find #=> #<Hashie::Mash example="example.com">

    # Type of a variable to hash.
    client.request.return_variable = 'hash'
    puts client.datacenters.find #=> {"example"=>"https://example.com"}

    # Type of a variable to json.
    client.request.return_variable = 'json'
    puts client.datacenters.find #=> {"example": "https://example.com"}


## Copyright

Copyright (c) 2011 ogom. See LICENSE.md for further details.