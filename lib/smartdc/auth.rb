require 'openssl'

module Smartdc
  module Auth
    def self.sign(options={})
      rsa = OpenSSL::PKey::RSA.new File.read options[:rsa_path]
      sha256 = OpenSSL::Digest::SHA256.new
      raw = [rsa.sign(sha256, options[:date])].pack('m').delete("\r\n")
      "Signature keyId=\"/#{options[:username]}/keys/#{options[:use_key]}\",algorithm=\"rsa-sha256\" #{raw}"
    end
  end
end
