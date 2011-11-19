require 'smartdc/api/machine_tags'

module Smartdc
  module Api
    class Machines
      attr_reader :request
      attr_reader :id

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
        request.status == 204 ? true : false
      end

      def stop
        raise ArgumentError unless id
        request.post('my/machines/' + id.to_s, {'action'=>'stop'})
        request.status == 202 ? true : false
      end

      def start
        raise ArgumentError unless id
        request.post('my/machines/' + id.to_s, {'action'=>'start'})
        request.status == 202 ? true : false
      end

      def reboot
        raise ArgumentError unless id 
        request.post('my/machines/' + id.to_s, {'action'=>'reboot'})
        request.status == 202 ? true : false
      end

      def resize(params={})
        raise ArgumentError unless id
        params[:action] = 'resize'
        request.post('my/machines/' + id.to_s, params)
        request.status == 202 ? true : false
      end

      def tags(sid=nil)
        raise ArgumentError unless id
        Smartdc::Api::MachineTags.new(request, id, sid)
      end
      
=begin
Hold List.  
  CreateMachineSnapshot
  StartMachineFromSnapshot
  ListMachineSnapshots
  GetMachineSnapshot
  DeleteMachineSnapshot
  
  UpdateMachineMetadata
  GetMachineMetadata
  DeleteMachineMetadata
  DeleteAllMachineMetadata
=end
    end
  end
end