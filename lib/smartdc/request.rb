require 'json'
require 'faraday'
require 'smartdc/auth'
#require 'smartdc/response/raise_error'

module Smartdc
  class Request
    def initialize(options)
      @options = options
    end

    def get(path, query={})
      request(:get, path, query, {})
    end

    def post(path, raw={})
      request(:post, path, {}, raw)
    end

    def put(path, raw={})
      request(:put, path, {}, raw)
    end

    def del(path, query={})
      request(:delete, path, query, {})
    end

    def request(method, path, query={}, raw={})
      path = path.gsub(/^my/, @options[:username])
      res = connection.send(method) do |req|
        case method
        when :get
          req.url path, query
        when :post, :put
          req.path = path
          req.body = raw.to_json unless raw.empty?
        when :delete
          req.url path
        end

        if @options[:debug]
          print 'Request: '
          puts "method: #{req.method.to_s}"
          puts "path: #{req.path}"
          puts "params: #{req.params}"
          puts "headers: #{req.headers}"
          puts "body: #{req.body}"
        end
      end

      if @options[:debug]
        print 'Response: '
        puts "status: #{res.status}"
        puts "headers: #{res.headers}"
        puts "body: #{res.body}"
      end

      Smartdc::Response.new(res)
    end

  private

    def connection
      options = {
        :url => 'https://' + @options[:hostname],
        :ssl => {:verify => false},
        :headers => {
          :date => Time.now.gmtime.to_s,
          'content-type'=>'application/json',
          'x-api-version' => @options[:version]
        }
      }

      options[:headers][:authorization] = Smartdc::Auth::sign(options, @options) if @options[:rsa_path] && !@options[:password]

      Faraday.new(options) do |builder|
        builder.request :basic_auth, @options[:username], @options[:password] if @options[:password]
        # builder.use Smartdc::Response::RaiseError
        builder.adapter Faraday.default_adapter
      end
    end
  end
end
