require 'smartdc/api/machine/tags'
require 'smartdc/api/machine/metadata'
require 'smartdc/api/machine/snapshots'

module Smartdc
  module Api
    class Machines
      attr_reader :request

      def initialize(options)
        @options = options
        @request = Smartdc::Request.new(options)
      end

      def create(raw={})
        request.post('my/machines/', raw)
      end
      
      def read(id)
        raise ArgumentError unless id
        request.get('my/machines/' + id.to_s)
      end

      def all(query={})
        request.get('my/machines', query)
      end

      def destroy(id)
        raise ArgumentError unless id
        request.del('my/machines/' + id.to_s)
      end

      def stop(id)
        raise ArgumentError unless id
        request.post('my/machines/' + id.to_s, {'action'=>'stop'})
      end

      def start(id)
        raise ArgumentError unless id
        request.post('my/machines/' + id.to_s, {'action'=>'start'})
      end

      def reboot(id)
        raise ArgumentError unless id 
        request.post('my/machines/' + id.to_s, {'action'=>'reboot'})
      end

      def resize(id, query={})
        raise ArgumentError unless id
        query['action'] = 'resize'
        request.post('my/machines/' + id.to_s, query)
      end

      def tags(id)
        raise ArgumentError unless id
        Smartdc::Api::Machine::Tags.new(id, @options)
      end
      
      def metadata(id)
        raise ArgumentError unless id
        Smartdc::Api::Machine::Metadata.new(id, @options)
      end
      
      def snapshots(id)
        raise ArgumentError unless id
        Smartdc::Api::Machine::Snapshots.new(id, @options)
      end
    end
  end
end