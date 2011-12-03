require 'hashie/mash'
require 'multi_json'
require 'faraday'
require 'faraday/response/mashify'
require 'faraday/response/parse_json'

module Smartdc
  class Request
    attr_reader :url, :version, :response, :username, :password
    attr_accessor :return_variable

    def initialize(options)
      @url = options['url']
      @version = options['version']
      @username = options['username']
      @password = options['password']
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
      @response = connection.send(method) do |request|
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
      @response.body
    end

    def connection
      case return_variable
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
        builder.use Faraday::Response::Mashify   if middleware > 2
        builder.use Faraday::Response::ParseJson if middleware > 1
        builder.adapter Faraday.default_adapter
      end
    end

    def basic_auth(username, password)
      'Basic ' + Base64.encode64("#{username}:#{password}").gsub!("\n", '')
    end
  end
end