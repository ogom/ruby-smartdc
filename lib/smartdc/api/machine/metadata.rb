module Smartdc::Api
  module Machine
    class Metadata
      attr_reader :request

      def initialize(id, options)
        @id = id
        @request = Smartdc::Request.new(options)
      end

      def create(raw={})
        request.post('my/machines/' + @id.to_s + '/metadata/', raw)
      end

      def read(query={})
        request.get('my/machines/' + @id.to_s + '/metadata', query)
      end

      def destroy(id=nil)
        request.del('my/machines/' + @id.to_s + '/metadata/' + id.to_s)
      end
    end
  end
end
