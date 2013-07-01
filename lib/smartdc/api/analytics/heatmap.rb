module Smartdc::Api
  class Analytics
    class Heatmap
      attr_reader :request, :id

      def initialize(request, id)
        @request = request
        @id = id
      end

      def image(query={})
        request.get('my/analytics/instrumentations/' + @id.to_s + '/value/heatmap/image', query)
      end

      def details(query={})
        request.get('my/analytics/instrumentations/' + @id.to_s + '/value/heatmap/details', query)
      end  
    end
  end
end
