require 'thor'
require 'cassette-rack/response/raise_error'
require 'smartdc/cli_helper'
require 'smartdc/cli_configure'
require 'smartdc/cli/datacenter'
require 'smartdc/cli/image'
require 'smartdc/cli/package'
require 'smartdc/cli/key'
require 'smartdc/cli/machine'
require 'smartdc/cli/analytic'

module Smartdc
  module Cli
    class Main < Thor
      namespace 'sdc'
      class_option :raw, type: :boolean, aliases: '-r', desc: 'Response body of raw.'

      map '-v' => :version
      desc 'version', 'Prints current version.'
      def version
        puts "sdc #{Smartdc::VERSION}"
      end

      desc 'init', 'Sets up configuration for use with this CLI.'
      def init
        clicfg = Smartdc::CliConfigure.new
        clicfg.init
        Smartdc::Cli.setup
        Smartdc.keys
        puts 'Successful configuration.'
      rescue
        puts 'Failed Configuration.'
      end

      cmd = ' [COMMAND]'
      register(Smartdc::Cli::Datacenter, 'datacenter', 'datacenter' + cmd, 'Smart datacenters')
      register(Smartdc::Cli::Image, 'image', 'image' + cmd, 'Machine images')
      register(Smartdc::Cli::Package, 'package', 'package' + cmd, 'Machine resources')
      register(Smartdc::Cli::Key, 'key', 'key' + cmd, 'SSH key')
      register(Smartdc::Cli::Machine, 'machine', 'machine' + cmd, 'Virtual machine')
      register(Smartdc::Cli::Analytic, 'analytic', 'analytic' + cmd, 'DTrace analytics')
    end

    class << self
      def setup
        clicfg = Smartdc::CliConfigure.new
        sdccfg = clicfg.read
        Smartdc.configure do |config|
          config.url = "https://#{sdccfg[:hostname]}" if sdccfg.key?(:hostname)
          config.version = sdccfg[:version] if sdccfg.key?(:version)
          config.username = sdccfg[:username] if sdccfg.key?(:username)
          config.use_key = sdccfg[:use_key] if sdccfg.key?(:use_key)
          config.rsa_path = sdccfg[:rsa_path] if sdccfg.key?(:rsa_path)
          config.ssl_verify = sdccfg[:ssl_verify].to_s =~ /false|0/ ? false : true
          config.middleware = Faraday::RackBuilder.new do |builder|
            builder.adapter Faraday.default_adapter
            #builder.use CassetteRack::Response::RaiseError
            #builder.response :logger
          end
        end
      end
    end
  end
end

Smartdc::Cli.setup
