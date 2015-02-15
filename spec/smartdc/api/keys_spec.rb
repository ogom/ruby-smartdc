require 'spec_helper'

describe Smartdc::Api::Keys do
  let(:key) do
    {
      name: 'example',
      key: File.read(File.expand_path('./spec/fixtures/ssh/id_rsa.pub'))
    }
  end

  describe ".create_key", vcr: { cassette_name: 'keys/create' } do
    it "creates a new key" do
      expect(Smartdc.create_key(key).content['name']).to eq(key[:name])
    end
  end

  describe ".keys", vcr: { cassette_name: 'keys/index' } do
    it "receives list of keys" do
      expect(Smartdc.keys.content.count).to be > 0
    end
  end

  describe ".key", vcr: { cassette_name: 'keys/show' } do
    it "receives a key" do
      expect(Smartdc.key(key[:name]).content['name']).to eq(key[:name])
    end
  end

  describe ".destroy_key", vcr: { cassette_name: 'keys/destroy' } do
    it "removes a key" do
      expect(Smartdc.destroy_key(key[:name]).status).to eq(204)
    end
  end
end
