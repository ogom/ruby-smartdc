module Smartdc::Api
  class Analytics
    class Instrumentations
      attr_reader :request, :id

      def initialize(request, id)
        @request = request
        @id = id
      end

      def create(params={})
        request.post('my/analytics/instrumentations/', params)
      end
      
      def read
        raise ArgumentError unless id
        request.get('my/analytics/instrumentations/' + id.to_s)
      end

      def find(params={})
        request.get('my/analytics/instrumentations/', params)
      end

      def delete
        request.delete('my/analytics/instrumentations/' + id.to_s)
        request.response.status == 204 ? true : false
      end

      def value
        raise ArgumentError unless id
        request.get('my/analytics/instrumentations/' + id.to_s + '/value/raw')
      end
      
      def heatmap(params={})
        raise ArgumentError unless id
        request.get('my/analytics/instrumentations/' + id.to_s + '/value/heatmap/image', params)
      end
      
      def heatmap_details(params={})
        raise ArgumentError unless id
        request.get('my/analytics/instrumentations/' + id.to_s + '/value/heatmap/details', params)
      end  
    end
  end
end