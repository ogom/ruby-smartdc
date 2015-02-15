require 'faraday'

module Smartdc
  module Default
    URL        = 'https://us-west-1.api.joyentcloud.com'.freeze
    VERSION    = '~7.0'.freeze
    SSL_VERIFY = true.freeze
    RSA_PATH   = '~/.ssh'.freeze
    MIDDLEWARE = Faraday::RackBuilder.new do |builder|
      builder.adapter Faraday.default_adapter
    end

    class << self
      def url
        URL
      end

      def version
        VERSION
      end

      def ssl_verify
        SSL_VERIFY
      end

      def rsa_path
        RSA_PATH
      end

      def middleware
        MIDDLEWARE
      end
    end
  end
end
