module Smartdc
  module Api
    class Keys
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def create(params={})
        request.post('my/keys/', params)
      end

      def read(id)  
        request.get('my/keys/' + id.to_s)
      end

      def find(params={})
        request.get('my/keys', params)
      end

      def delete(id)  
        request.delete('my/keys/' + id.to_s)
        request.status == 204 ? true : false
      end
    end
  end
end