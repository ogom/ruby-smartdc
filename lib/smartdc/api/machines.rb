module Smartdc
  module Api
    class Machines
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def create(params={})
        request.post('my/machines/', params)
      end
      
      def read(id)  
        request.get('my/machines/' + id.to_s)
      end

      def find(params={})
        request.get('my/machines', params)
      end

      def delete(id)  
        request.delete('my/machines/' + id.to_s)
        request.status == 204 ? true : false
      end

      def stop(id)  
        request.post('my/machines/' + id.to_s, {'action'=>'stop'})
        request.status == 202 ? true : false
      end

      def start(id)  
        request.post('my/machines/' + id.to_s, {'action'=>'start'})
        request.status == 202 ? true : false
      end

      def reboot(id)  
        request.post('my/machines/' + id.to_s, {'action'=>'reboot'})
        request.status == 202 ? true : false
      end

      def resize(id, params={})
        params[:action] = 'resize'
        request.post('my/machines/' + id.to_s, params)
        request.status == 202 ? true : false
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
  AddMachineTags
  ListMachineTags
  GetMachineTag
  DeleteMachineTag
  DeleteMachineTags
=end
    end
  end
end