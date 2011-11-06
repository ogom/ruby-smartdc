module Smartdc
  module Api
    class Datacenters
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def read(id)  
        request.get('my/datacenters/' + id.to_s)
      end

      def find(params={})
        request.get('my/datacenters', params)
      end
    end
  end
end