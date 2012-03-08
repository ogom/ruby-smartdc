require 'hashie/mash'
require 'multi_json'
require 'faraday'
require 'smartdc/response/mashify'
require 'smartdc/response/parse_json'
require 'smartdc/response/raise_error'

module Smartdc
  class Request
    attr_reader :url, :version, :username, :password
    attr_accessor :format

    def initialize(options)
      @url = options['url']
      @version = options['version']
      @username = options['username']
      @password = options['password']
      @format = options['format']
    end

    def get(path, params={})
      request(:get, path, params)
    end

    def post(path, params={})
      request(:post, path, params)
    end

    def put(path, params={})
      request(:put, path, params)
    end

    def delete(path, params={})
      request(:delete, path, params)
    end

  private
    def request(method, path, params={})
      response = connection.send(method) do |request|
        case method
        when :get
          request.url path, params
        when :post, :put
          request.path = path
          request.body = MultiJson.encode(params) unless params.empty?
        when :delete
          request.url path
          request.headers = {'content-length'=>'0'}  
        end
      end
      response.body
    end

    def connection
      case format
      when 'mash', nil
        middleware = 3
      when 'hash'
        middleware = 2
      when 'json'
        middleware = 1
      else
        middleware = 0
      end

      options = {
        :url => url,
        :ssl => {:verify => false},
        :headers => {
          'authorization' => basic_auth(username, password),
          'X-Api-Version' => version
        }
      }

      Faraday.new(options) do |builder|
        builder.use Faraday::Request::JSON
        builder.use Smartdc::Response::Mashify   if middleware > 2
        builder.use Smartdc::Response::ParseJson if middleware > 1
        builder.use Smartdc::Response::RaiseError
        builder.adapter Faraday.default_adapter
      end
    end

    def basic_auth(username, password)
      'Basic ' + ["#{username}:#{password}"].pack('m').delete("\r\n")
    end
  end
end