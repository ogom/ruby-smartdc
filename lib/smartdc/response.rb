module Smartdc
  class Response
    attr_reader :status, :headers
    attr_accessor :body

    def initialize(response)
      @status = response.status
      @headers = response.headers
      @body = response.body
    end

    def content
      case @body
      when nil, ''
        nil
      when 'true'
        true
      when 'false'
        false
      else
        JSON.parse(@body)
      end
    end
  end
end
