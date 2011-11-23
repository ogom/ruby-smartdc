module Smartdc
  module Api
    class Packages
      attr_reader :request, :id

      def initialize(request, id=nil)
        @request = request
        @id = id
      end

      def read
        raise ArgumentError unless id
        request.get('my/packages/' + id.to_s)
      end

      def find(params={})
        request.get('my/packages', params)
      end
    end
  end
end