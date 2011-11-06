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
    end
  end
end