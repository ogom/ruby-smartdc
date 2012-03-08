require 'faraday'

module Smartdc
  module Response
    class ParseJson < Faraday::Response::Middleware
      dependency do
        require 'multi_json'
      end

      def parse(body)
        case body
        when ''
          nil
        when 'true'
          true
        when 'false'
          false
        else
          ::MultiJson.decode(body)
        end
      rescue
        body
      end
    end
  end
end