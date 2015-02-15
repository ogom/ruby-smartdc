module Smartdc::Cli
  class MachineSnapshot < Thor
    include Smartdc::CliHelper

    namespace 'machine snapshot'
    class_option :id, type: :string, aliases: '-m', desc: 'Machine id'

    desc 'list', 'Lists all snapshots taken for a given machine. '
    def list
      id = use_machine(options['id'])
      output Smartdc.machine_snapshots(id), options.merge(table: :horizontal)
    end

    desc 'show [NAME]', 'Gets the state of the named snapshot.'
    def show(name)
      id = use_machine(options['id'])
      output Smartdc.machine_snapshot(id, name), options.merge(table: :vertical)
    end

    desc 'add [NAME]', 'Allows you to take a snapshot of a machine.'
    def add(name)
      id = use_machine(options['id'])
      output Smartdc.create_machine_snapshot(id, {name: name}), options.merge(table: :vertical)
    end

    desc 'destroy [NAME]', 'Deletes the specified snapshot of a machine.'
    def destroy(name)
      id = use_machine(options['id'])
      output Smartdc.destroy_machine_snapshot(id, name), options.merge(message: "Destroy [#{name}] of machine snapshot.")
    end

    desc 'start [NAME]', 'Starts a stopped machine from the referenced snapshot.'
    def start(name)
      id = use_machine(options['id'])
      output Smartdc.start_machine_snapshot(id, name), options.merge(message: "Start [#{name}] of machine snapshot.")
    end
  end
end
