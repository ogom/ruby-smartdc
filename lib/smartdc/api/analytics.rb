require 'smartdc/api/analytics/instrumentations'

module Smartdc
  module Api
    class Analytics
      attr_reader :request, :id

      def initialize(request, id=nil)
        @request = request
        @id = id
      end

      def describe
        request.get('my/analytics')
      end

      def instrumentations(_id=nil)
        Smartdc::Api::Analytics::Instrumentations.new(request, _id)
      end
    end
  end
end