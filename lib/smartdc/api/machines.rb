require 'smartdc/api/machine/tags'
require 'smartdc/api/machine/metadata'

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
        request.response.status == 204 ? true : false
      end

      def stop
        raise ArgumentError unless id
        request.post('my/machines/' + id.to_s, {'action'=>'stop'})
        request.response.status == 202 ? true : false
      end

      def start
        raise ArgumentError unless id
        request.post('my/machines/' + id.to_s, {'action'=>'start'})
        request.response.status == 202 ? true : false
      end

      def reboot
        raise ArgumentError unless id 
        request.post('my/machines/' + id.to_s, {'action'=>'reboot'})
        request.response.status == 202 ? true : false
      end

      def resize(params={})
        raise ArgumentError unless id
        params[:action] = 'resize'
        request.post('my/machines/' + id.to_s, params)
        request.response.status == 202 ? true : false
      end

      def tags(_id=nil)
        raise ArgumentError unless id
        Smartdc::Api::Machine::Tags.new(request, id, _id)
      end
      
      def metadata(_id=nil)
        raise ArgumentError unless id
        Smartdc::Api::Machine::Metadata.new(request, id, _id)
      end
      
=begin
Hold List.  
  CreateMachineSnapshot
  StartMachineFromSnapshot
  ListMachineSnapshots
  GetMachineSnapshot
  DeleteMachineSnapshot
=end
    end
  end
end