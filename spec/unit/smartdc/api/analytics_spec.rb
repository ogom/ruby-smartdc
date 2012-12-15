require 'spec_helper'

describe "Smartdc::Api::Analytics" do
  
  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".create" do
    it "should return a instrumentation" do
      @object.stub(:content) {fixture('analytics')[0]}
      analytic = @object.content
      @request.stub_chain(:new, :post).with('my/analytics/instrumentations/', analytic) {@object}

      analytics = Smartdc::Api::Analytics.new({})
      analytics.create(analytic).content['id'].should == analytic['id']
    end
  end

  describe ".read" do
    it "should return a instrumentation" do
      @object.stub(:content) {fixture('analytics')[0]}
      id = @object.content['id']
      @request.stub_chain(:new, :get).with('my/analytics/instrumentations/' + id) {@object}

      analytics = Smartdc::Api::Analytics.new({})
      analytics.read(id).content['id'].should == id
    end
  end

  describe ".all" do
    it "should return some instrumentations" do
      @object.stub(:content) {fixture('analytics')}
      @request.stub_chain(:new, :get).with('my/analytics/instrumentations', {}) {@object}

      analytics = Smartdc::Api::Analytics.new({})
      analytics.all.content.count.should > 0
    end
  end

  describe ".delete" do
    it "should return true when success" do
      analytic = fixture('analytics')[0]
      @object.stub(:status) {204}
      @request.stub_chain(:new, :del).with('my/analytics/instrumentations/' + analytic['id']) {@object}

      analytics = Smartdc::Api::Analytics.new({})
      analytics.destroy(analytic['id']).status.should == 204
    end
  end

end
