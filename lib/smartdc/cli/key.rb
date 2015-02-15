module Smartdc::Cli
  class Key < Thor
    include Smartdc::CliHelper

    desc 'list', 'Lists all public keys we have on record for the specified account.'
    def list
      output Smartdc.keys, options.merge(table: :horizontal, exclude: %i[key])
    end

    desc 'show [NAME]', 'Retrieves the record for an individual key.'
    def show(name)
      output Smartdc.key(name), options.merge(only: :key)
    end

    desc 'add [NAME] [FILE]', 'Uploads a new OpenSSH key.'
    def add(name, file)
      body = { name: name, key: File.read(file) }
      output Smartdc.create_key(body), options.merge(table: :vertical, exclude: %i[key])
    end

    desc 'destroy [NAME]', 'Deletes a single SSH key, by name or fingerprint.'
    def destroy(name)
      output Smartdc.destroy_key(name), options.merge(message: "Key #{name} destroy.")
    end
  end
end
