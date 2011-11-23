module Smartdc
  module Api::Machine
    class Metadata
      attr_reader :request, :id

      def initialize(request, id1, id)
        @request = request
        @id1 = id1
        @id = id
      end

      def create(params={})
        request.post('my/machines/' + @id1.to_s + '/metadata/', params)
      end
      
      def read
        raise ArgumentError unless id
        request.get('my/machines/' + @id1.to_s + '/metadata/' + id.to_s)
      end

      def find(params={})
        request.get('my/machines/' + @id1.to_s + '/metadata/', params)
      end

      def delete
        request.delete('my/machines/' + @id1.to_s + '/metadata/' + id.to_s)
        request.status == 204 ? true : false
      end
    end
  end
end