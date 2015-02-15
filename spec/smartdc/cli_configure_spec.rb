require 'spec_helper'

describe Smartdc::CliConfigure do
  let(:path) { './spec/fixtures/config/.sdccfg' }
  let(:configure) { Smartdc::CliConfigure.new(path) }
  let(:options) do
    {
      hostname: 'example.com',
      version:  '~7.0',
      username: 'user',
      use_key:  '4c:02:f3:b2:09:fb:29:dd:41:97:da:80:bc:69:6c:f8'
    }
  end

  describe "#path" do
    it "returns a path" do
      expect(configure.path).to eq path
    end
  end

  describe "#read" do
    it "returns some configuration" do
      expect(configure.read).to eq options
    end
  end

  describe "#write" do
    it "returns some configuration" do
      expect(configure.write(options)).to eq options
    end
  end
end
