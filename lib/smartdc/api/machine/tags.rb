module Smartdc::Api
  module Machine
    class Tags
      attr_reader :request

      def initialize(id, options)
        @id = id
        @request = Smartdc::Request.new(options)
      end

      def create(raw={})
        request.post('my/machines/' + @id.to_s + '/tags/', raw)
      end
      
      def read(id)
        raise ArgumentError unless id
        request.get('my/machines/' + @id.to_s + '/tags/' + id.to_s)
      end

      def all(query={})
        request.get('my/machines/' + @id.to_s + '/tags', query)
      end

      def destroy(id=nil)
        request.del('my/machines/' + @id.to_s + '/tags/' + id.to_s)
      end
    end
  end
end
