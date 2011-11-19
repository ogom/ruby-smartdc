module Smartdc
  module Api
    class Keys
      attr_reader :request
      attr_reader :id

      def initialize(request, id=nil)
        @request = request
        @id = id
      end

      def create(params={})
        request.post('my/keys/', params)
      end

      def read
        raise ArgumentError unless id
        request.get('my/keys/' + id.to_s)
      end

      def find(params={})
        request.get('my/keys', params)
      end

      def delete
        raise ArgumentError unless id
        request.delete('my/keys/' + id.to_s)
        request.status == 204 ? true : false
      end
    end
  end
end