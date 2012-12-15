require 'spec_helper'

describe "Smartdc::Api::Keys" do

  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".create" do
    it "should return a key" do
      @object.stub(:content) {fixture('keys')[0]}
      key = @object.content
      @request.stub_chain(:new, :post).with('my/keys/', key) {@object}

      keys = Smartdc::Api::Keys.new({})
      keys.create(key).content['name'].should == key['name']
    end
  end

  describe ".read" do
    it "should return a key" do
      @object.stub(:content) {fixture('keys')[0]}
      name = @object.content['name']
      @request.stub_chain(:new, :get).with('my/keys/' + name) {@object}

      keys = Smartdc::Api::Keys.new({})
      keys.read(name).content['name'].should == name
    end
  end

  describe ".all" do
    it "should return some keys" do
      @object.stub(:content) {fixture('keys')}
      @request.stub_chain(:new, :get).with('my/keys', {}) {@object}

      keys = Smartdc::Api::Keys.new({})
      keys.all.content.count.should > 0
    end
  end

  describe ".delete" do
    it "should return true when success" do
      key = fixture('keys')[0]
      @object.stub(:status) {204}
      @request.stub_chain(:new, :del).with('my/keys/' + key['name']) {@object}

      keys = Smartdc::Api::Keys.new({})
      keys.destroy(key['name']).status.should == 204
    end
  end

end