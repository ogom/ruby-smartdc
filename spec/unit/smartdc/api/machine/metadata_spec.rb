require 'spec_helper'

describe "Smartdc::Api::Machine::Metadata" do
  
  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".create" do
    it "should return a metadata" do
      @object.stub(:content) {fixture('tag')}
      tag = @object.content
      @request.stub_chain(:new, :post).with('my/machines/id/metadata/', tag) {@object}

      metadata = Smartdc::Api::Machine::Metadata.new('id', {})
      metadata.create(tag).content.should == tag
    end
  end

  describe ".read" do
    it "should return some metadata" do
      @object.stub(:content) {fixture('tag')}
      @request.stub_chain(:new, :get).with('my/machines/id/metadata', {}) {@object}

      metadata = Smartdc::Api::Machine::Metadata.new('id', {})
      metadata.read.content.count.should > 0
    end
  end

  describe ".delete" do
    it "should return a metadata" do
      @object.stub(:status) {204}
      key = fixture('tag').first[0]
      @request.stub_chain(:new, :del).with('my/machines/id/metadata/' + key) {@object}

      metadata = Smartdc::Api::Machine::Metadata.new('id', {})
      metadata.destroy(key).status.should == 204
    end
  end

end
