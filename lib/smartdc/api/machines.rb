require 'smartdc/api/machine/tags'
require 'smartdc/api/machine/metadata'
require 'smartdc/api/machine/snapshots'

module Smartdc
  module Api
    class Machines
      attr_reader :request, :id

      def initialize(request, id=nil)
        @request = request
        @id = id
      end

      def create(params={})
        request.post('my/machines/', params)
      end
      
      def read
        raise ArgumentError unless id
        request.get('my/machines/' + id.to_s)
      end

      def find(params={})
        request.get('my/machines', params)
      end

      def delete
        raise ArgumentError unless id
        request.delete('my/machines/' + id.to_s)
      end

      def stop
        raise ArgumentError unless id
        request.post('my/machines/' + id.to_s, {'action'=>'stop'})
      end

      def start
        raise ArgumentError unless id
        request.post('my/machines/' + id.to_s, {'action'=>'start'})
      end

      def reboot
        raise ArgumentError unless id 
        request.post('my/machines/' + id.to_s, {'action'=>'reboot'})
      end

      def resize(params={})
        raise ArgumentError unless id
        params[:action] = 'resize'
        request.post('my/machines/' + id.to_s, params)
      end

      def tags(_id=nil)
        raise ArgumentError unless id
        Smartdc::Api::Machine::Tags.new(request, id, _id)
      end
      
      def metadata(_id=nil)
        raise ArgumentError unless id
        Smartdc::Api::Machine::Metadata.new(request, id, _id)
      end
      
      def snapshots(_id=nil)
        raise ArgumentError unless id
        Smartdc::Api::Machine::Snapshots.new(request, id, _id)
      end
    end
  end
end