require 'faraday'

module Smartdc
  class Response
    class RaiseError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status]
        when 400
          raise Smartdc::Error::BadRequest, response_values(env)
        when 401
          raise Smartdc::Error::Unauthorized, response_values(env)
        when 403
          raise Smartdc::Error::Forbidden, response_values(env)
        when 404
          raise Smartdc::Error::NotFound, response_values(env)
        when 405
          raise Smartdc::Error::MethodNotAllowed, response_values(env)
        when 406
          raise Smartdc::Error::NotAcceptable, response_values(env)
        when 409
          raise Smartdc::Error::Conflict, response_values(env)
        when 500
          raise Smartdc::Error::InternalServerError, response_values(env)
        when 501 
          raise Smartdc::Error::NotImplemented, response_values(env)
        when 502
          raise Smartdc::Error::BadGateway, response_values(env)
        when 503
          raise Smartdc::Error::ServiceUnavailable, response_values(env)
        end
      end

      def response_values(env)
        {:status => env[:status], :headers => env[:response_headers], :body => env[:body]}
      end
    end
  end
end
