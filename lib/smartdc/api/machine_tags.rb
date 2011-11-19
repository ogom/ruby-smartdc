module Smartdc
  module Api
    class MachineTags
      attr_reader :request
      attr_reader :id

      def initialize(request, pid, sid)
        @request = request
        @pid = pid
        @id = sid
      end

      def create(params={})
        request.post('my/machines/' + @pid.to_s + '/tags/', params)
      end
      
      def read
        raise ArgumentError unless id
        request.get('my/machines/' + @pid.to_s + '/tags/' + id.to_s)
      end

      def find(params={})
        request.get('my/machines/' + @pid.to_s + '/tags/', params)
      end

      def delete
        request.delete('my/machines/' + @pid.to_s + '/tags/' + id.to_s)
        request.status == 204 ? true : false
      end
    end
  end
end