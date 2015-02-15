require 'smartdc/cli/machine/tag'
require 'smartdc/cli/machine/metadata'
require 'smartdc/cli/machine/snapshot'

module Smartdc::Cli
  class Machine < Thor
    include Smartdc::CliHelper

    desc 'list', 'Lists all machines we have on record for your account.'
    method_option :type, type: :string, aliases: '-t', desc: 'virtualmachine or smartmachine'
    method_option :state, type: :string, aliases: '-s', desc: 'running or stopped'
    def list
      output Smartdc.machines(options), options.merge(table: :horizontal, include: %i[
        id name state primaryIp memory disk dataset
      ])
    end

    desc 'show [ID]', 'Gets the details for an individual machine.'
    def show(id=nil)
      output Smartdc.machine(use_machine(id)), options.merge(table: :vertical)
    end

    desc 'add [NAME]', 'Allows you to provision a machine.'
    method_option :image, type: :string, aliases: '-i', desc: 'The image UUID'
    method_option :package, type: :string, aliases: '-p', desc: 'Id of the package to use on provisioning'
    def add(name)
      body = {name: name}.merge(options)
      output Smartdc.create_machine(body), options.merge({table: :vertical})
    end

    desc 'destroy [ID]', 'Allows you to completely destroy a machine.'
    def destroy(id=nil)
      id = use_machine(id)
      output Smartdc.destroy_machine(id), options.merge(message: "Destroy [#{id}] of machine.")
    end

    desc 'stop [ID]', 'Allows you to shut down a machine.'
    def stop(id=nil)
      id = use_machine(id)
      output Smartdc.stop_machine(id), options.merge(message: "Stop [#{id}] of machine.")
    end

    desc 'start [ID]', 'Allows you to boot up a machine.'
    def start(id=nil)
      id = use_machine(id)
      output Smartdc.start_machine(id), options.merge(message: "Start [#{id}] of machine.")
    end

    desc 'reboot [ID]', 'Allows you to reboot a machine'
    def reboot(id=nil)
      id = use_machine(id)
      output Smartdc.reboot_machine(id), options.merge(message: "Reboot [#{id}] of machine.")
    end

    desc 'resize [ID]', 'Resize a machine to a new package.'
    method_option :package, type: :string, aliases: '-p', desc: 'A package id, as returned from ListPackages'
    def resize(id=nil)
      body = {package: options[:package]}
      id = use_machine(id)
      output Smartdc.resize_machine(id, body), options.merge(message: "Resize [#{id}] of machine.")
    end

    desc 'use [ID]', 'Sets use machine.'
    def use(id=nil)
      clicfg = Smartdc::CliConfigure.new
      sdccfg = clicfg.read
      if id.nil?
        puts "Use [#{sdccfg[:use_machine]}] of machine."
      else
        sdccfg[:use_machine] = id
        clicfg.write(sdccfg)
      end
    end

    register(Smartdc::Cli::MachineTag, 'tag', 'tag [COMMAND]', 'Machine tag')
    register(Smartdc::Cli::MachineMetadata, 'meta', 'meta [COMMAND]', 'Machine metadata')
    register(Smartdc::Cli::MachineSnapshot, 'snapshot', 'snapshot [COMMAND]', 'Machine snapshot')
  end
end
