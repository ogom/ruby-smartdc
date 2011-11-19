module Smartdc
  module Api
    class Datasets
      attr_reader :request
      attr_reader :id

      def initialize(request, id=nil)
        @request = request
        @id = id
      end

      def read
        raise ArgumentError unless id
        request.get('my/datasets/' + id.to_s)
      end

      def find(params={})
        request.get('my/datasets', params)
      end
    end
  end
end