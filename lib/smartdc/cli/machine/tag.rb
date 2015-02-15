module Smartdc::Cli
  class MachineTag < Thor
    include Smartdc::CliHelper

    namespace 'machine tag'
    class_option :id, type: :string, aliases: '-m', desc: 'Machine id'

    desc 'list', 'Returns the complete set of tags associated with this machine.'
    def list
      id = use_machine(options['id'])
      output Smartdc.machine_tags(id), options.merge(table: :vertical)
    end

    desc 'show [KEY]', 'Returns the value for a single tag on this machine.'
    def show(key)
      id = use_machine(options['id'])
      response = Smartdc.machine_tag(id, key)
      output response, options.merge(message: response.content)
    end

    desc 'add [KEY] [VALUE]', 'Allows you to add additional tags, other than those set at provisioning time.'
    def add(key, value)
      id = use_machine(options['id'])
      output Smartdc.create_machine_tag(id, {key => value}), options.merge(table: :vertical)
    end

    desc 'destroy [KEY]', 'Deletes a single tag from this machine.'
    def destroy(key)
      id = use_machine(options['id'])
      output Smartdc.destroy_machine_tag(id, key), options.merge(message: "Destroy [#{key}] of machine tag.")
    end
  end
end
