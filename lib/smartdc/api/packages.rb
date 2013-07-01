module Smartdc
  module Api
    class Packages
      attr_reader :request

      def initialize(options)
        @request = Smartdc::Request.new(options)
      end

      def read(id)
        raise ArgumentError unless id
        request.get('my/packages/' + id.to_s)
      end

      def all(query={})
        request.get('my/packages', query)
      end
    end
  end
end

