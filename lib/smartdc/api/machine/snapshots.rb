module Smartdc::Api
  module Machine
    class Snapshots
      attr_reader :request, :id

      def initialize(request, id1, id)
        @request = request
        @id1 = id1
        @id = id
      end

      def create(params={})
        request.post('my/machines/' + @id1.to_s + '/snapshots/', params)
      end
      
      def start
        raise ArgumentError unless id
        request.post('my/machines/' + @id1.to_s + '/snapshots/' + id.to_s)
        request.response.status == 202 ? true : false
      end

      def read
        raise ArgumentError unless id
        request.get('my/machines/' + @id1.to_s + '/snapshots/' + id.to_s)
      end

      def find(params={})
        request.get('my/machines/' + @id1.to_s + '/snapshots/', params)
      end

      def delete
        request.delete('my/machines/' + @id1.to_s + '/snapshots/' + id.to_s)
        request.response.status == 204 ? true : false
      end
    end
  end
end