require 'spec_helper'

describe Smartdc do
  describe ".configure" do
    let(:options) do
      {
        url:      'https://example.com',
        username: 'user',
        use_key:  'a1:b2:c3',
        rsa_path: '/ssh'
      }
    end

    before do
      Smartdc.configure do |config|
        config.url = options[:url]
        config.username = options[:username]
        config.use_key = options[:use_key]
        config.rsa_path = options[:rsa_path]
      end
    end

    it "gets of the config" do
      expect(Smartdc.config.url).to eq options[:url]
      expect(Smartdc.config.version).to eq '~7.0'
      expect(Smartdc.config.ssl_verify).to be_truthy
      expect(Smartdc.config.username).to eq options[:username]
      expect(Smartdc.config.use_key).to eq options[:use_key]
      expect(Smartdc.config.rsa_path).to eq options[:rsa_path]
    end
  end

  describe ".client" do
    it "returns a smartdc client" do
      expect(Smartdc.client).to be_a Smartdc::Client
    end
  end

  describe ".root" do
    it "returns a root path" do
      expect(Smartdc.root).to eq File.expand_path('..', File.dirname(__FILE__))
    end
  end
end
