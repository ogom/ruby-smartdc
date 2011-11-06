module Smartdc
  module Api
    class Datasets
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def read(id)  
        request.get('my/datasets/' + id.to_s)
      end

      def find(params={})
        request.get('my/datasets', params)
      end
    end
  end
end