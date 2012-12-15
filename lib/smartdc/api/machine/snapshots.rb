module Smartdc::Api
  module Machine
    class Snapshots
      attr_reader :request

      def initialize(id, options)
        @id = id
        @request = Smartdc::Request.new(options)
      end

      def create(raw={})
        request.post('my/machines/' + @id.to_s + '/snapshots/', raw)
      end

      def read(id)
        raise ArgumentError unless id
        request.get('my/machines/' + @id.to_s + '/snapshots/' + id.to_s)
      end

      def all(query={})
        request.get('my/machines/' + @id.to_s + '/snapshots', query)
      end

      def destroy(id)
        raise ArgumentError unless id
        request.del('my/machines/' + @id.to_s + '/snapshots/' + id.to_s)
      end

      def start(id)
        raise ArgumentError unless id
        request.post('my/machines/' + @id.to_s + '/snapshots/' + id.to_s)
      end
    end
  end
end