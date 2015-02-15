module Smartdc::Cli
  class MachineMetadata < Thor
    include Smartdc::CliHelper

    namespace 'machine meta'
    class_option :id, type: :string, aliases: '-m', desc: 'Machine id'

    desc 'list', 'Returns the complete set of metadata associated with this machine.'
    def list
      id = use_machine(options['id'])
      output Smartdc.machine_metadata(id), options.merge(table: :vertical, exclude: %i[
        root_authorized_keys
      ])
    end

    desc 'update [KEY] [VALUE]', 'Allows you to update the metadata for a given machine.'
    def update(key, value)
      id = use_machine(options['id'])
      output Smartdc.update_machine_metadata(id, {key => value}), options.merge(table: :vertical, exclude: %i[
        root_authorized_keys
      ])
    end

    desc 'destroy [KEY]', 'Deletes a single metadata key from this machine.'
    def destroy(key)
      id = use_machine(options['id'])
      output Smartdc.destroy_machine_metadata(id, key), options.merge(message: "Destroy [#{key}] of machine metadata.")
    end
  end
end
