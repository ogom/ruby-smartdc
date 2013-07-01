require 'smartdc/api/analytics/heatmap'

module Smartdc
  module Api
    class Analytics
      attr_reader :request

      def initialize(options)
        @request = Smartdc::Request.new(options)
      end

      def describe
        request.get('my/analytics')
      end

      def create(raw={})
        request.post('my/analytics/instrumentations/', raw)
      end

      def read(id)
        raise ArgumentError unless id
        request.get('my/analytics/instrumentations/' + id.to_s)
      end

      def all(query={})
        request.get('my/analytics/instrumentations', query)
      end

      def destroy(id)
        request.del('my/analytics/instrumentations/' + id.to_s)
      end

      def value(id)
        raise ArgumentError unless id
        request.get('my/analytics/instrumentations/' + id.to_s + '/value/raw')
      end

      def heatmap(id)
        raise ArgumentError unless id
        Smartdc::Api::Analytics::Heatmap.new(request, id)
      end
    end
  end
end
