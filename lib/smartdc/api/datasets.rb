module Smartdc
  module Api
    class Datasets
      attr_reader :request

      def initialize(options)
        @request = Smartdc::Request.new(options)
      end

      def read(id)
        raise ArgumentError unless id
        request.get('my/datasets/' + id.to_s)
      end

      def all(query={})
        request.get('my/datasets', query)
      end
    end
  end
end