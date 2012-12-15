module Smartdc
  module Api
    class Keys
      attr_reader :request

      def initialize(options)
        @request = Smartdc::Request.new(options)
      end

      def create(raw={})
        request.post('my/keys/', raw)
      end

      def read(id)
        raise ArgumentError unless id
        request.get('my/keys/' + id.to_s)
      end

      def all(query={})
        request.get('my/keys', query)
      end

      def destroy(id)
        raise ArgumentError unless id
        request.del('my/keys/' + id.to_s)
      end
    end
  end
end