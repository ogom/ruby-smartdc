require 'spec_helper'

describe "Smartdc::Api::Datasets" do

  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".read" do
    it "should return a dataset" do
      @object.stub(:content) {fixture('datasets')[0]}
      id = @object.content['id']
      @request.stub_chain(:new, :get).with('my/datasets/' + id) {@object}

      datasets = Smartdc::Api::Datasets.new({})
      datasets.read(id).content['id'].should == id
    end
  end

  describe ".all" do
    it "should return some datasets" do
      @object.stub(:content) {fixture('datasets')}
      @request.stub_chain(:new, :get).with('my/datasets', {}) {@object}

      datasets = Smartdc::Api::Datasets.new({})
      datasets.all.content.count.should > 0
    end
  end

end