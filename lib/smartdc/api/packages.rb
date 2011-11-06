module Smartdc
  module Api
    class Packages
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def read(id)  
        request.get('my/packages/' + id.to_s)
      end

      def find(params={})
        request.get('my/packages', params)
      end
    end
  end
end