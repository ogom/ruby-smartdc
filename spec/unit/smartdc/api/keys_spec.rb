require 'spec_helper'

describe Smartdc::Api::Keys do

  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".create" do
    it "creates a key" do
      @object.stub(:content) {fixture('keys')[0]}
      key = @object.content
      @request.stub_chain(:new, :post).with('my/keys/', key) {@object}

      keys = Smartdc::Api::Keys.new({})
      expect(keys.create(key).content['name']).to eq(key['name'])
    end
  end

  describe ".read" do
    it "return a key" do
      @object.stub(:content) {fixture('keys')[0]}
      name = @object.content['name']
      @request.stub_chain(:new, :get).with('my/keys/' + name) {@object}

      keys = Smartdc::Api::Keys.new({})
      expect(keys.read(name).content['name']).to eq(name)
    end
  end

  describe ".all" do
    it "return some keys" do
      @object.stub(:content) {fixture('keys')}
      @request.stub_chain(:new, :get).with('my/keys', {}) {@object}

      keys = Smartdc::Api::Keys.new({})
      expect(keys.all.content.count).to be > 1
    end
  end

  describe ".destroy" do
    it "return true when success" do
      key = fixture('keys')[0]
      @object.stub(:status) {204}
      @request.stub_chain(:new, :del).with('my/keys/' + key['name']) {@object}

      keys = Smartdc::Api::Keys.new({})
      expect(keys.destroy(key['name']).status).to eq(204)
    end
  end

end
