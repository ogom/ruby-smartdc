module Smartdc
  class Response
    attr_reader :status, :headers, :body, :content

    def initialize(response)
      @status = response.status
      @headers = response.headers
      @body = response.body
      self.content = @body
    end

    def content=raw
      case raw
      when nil, ''
        @content = nil
      when 'true'
        @content = true
      when 'false'
        @content = false
      else
        @content = JSON.parse(raw)
      end
    end
  end
end
