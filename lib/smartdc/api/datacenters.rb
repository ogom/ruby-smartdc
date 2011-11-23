module Smartdc
  module Api
    class Datacenters
      attr_reader :request, :id

      def initialize(request, id=nil)
        @request = request
        @id = id
      end

      def read
        raise ArgumentError unless id
        request.get('my/datacenters/' + id.to_s)
      end

      def find(params={})
        request.get('my/datacenters', params)
      end
    end
  end
end