module Smartdc
  module Api
    class Datacenters
      attr_reader :request

      def initialize(options)
        @request = Smartdc::Request.new(options)
      end

      def read(id)
        raise ArgumentError unless id
        request.get('my/datacenters/' + id.to_s)
      end

      def all(query={})
        request.get('my/datacenters', query)
      end
    end
  end
end