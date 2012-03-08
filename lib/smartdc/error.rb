module Smartdc
  class Error < StandardError
    attr_reader :response

    def initialize(response)
      @response = response
      begin
        body = JSON.parse(response[:body])
        if body['error_message']
          super(body['error_message'])
        else
          super(response[:body])
        end
      rescue
        super(response[:body])
      end
    end

    def response_status
      response[:status]
    end
  end

  class Error::BadRequest < Smartdc::Error; end
  class Error::Unauthorized < Smartdc::Error; end
  class Error::Forbidden < Smartdc::Error; end
  class Error::NotFound < Smartdc::Error; end
  class Error::MethodNotAllowed < Smartdc::Error; end
  class Error::NotAcceptable < Smartdc::Error; end
  class Error::Conflict < Smartdc::Error; end
  class Error::InternalServerError < Smartdc::Error; end
  class Error::NotImplemented < Smartdc::Error; end
  class Error::BadGateway < Smartdc::Error; end
  class Error::ServiceUnavailable < Smartdc::Error; end
end