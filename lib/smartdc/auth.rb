require 'openssl'

module Smartdc
  class Auth
    attr_reader :username, :rsa_path, :use_key

    def initialize(options={})
      @username = options[:username]
      @rsa_path = options[:rsa_path] ||= '~/.ssh'
      @use_key = options[:use_key]
    end

    def find_key_file
      path = File.expand_path(self.rsa_path)
      if File.directory?(path)
        Dir[File.join(path, '*')].each do |path|
          if File.file?(path)
            if self.use_key == self.fingerprint(path)
              return path
            end
          end
        end
        return nil
      else
        return path
      end
    end

    def read_key_file(path)
      OpenSSL::PKey::RSA.new(File.read(File.expand_path(path)), '')
    end

    def signature(data)
      rsa = read_key_file(self.find_key_file)
      sha256 = OpenSSL::Digest::SHA256.new
      str = [rsa.sign(sha256, data)].pack('m').delete("\r\n")
      "Signature keyId=\"/#{self.username}/keys/#{self.use_key}\",algorithm=\"rsa-sha256\" #{str}"
    rescue
      nil
    end

    def fingerprint(path)
      rsa = read_key_file(path)
      str = [7].pack('N') + 'ssh-rsa' + rsa.public_key.e.to_s(0) + rsa.public_key.n.to_s(0)
      OpenSSL::Digest::MD5.hexdigest(str).scan(/../).join(':')
    rescue
      nil
    end
  end
end
