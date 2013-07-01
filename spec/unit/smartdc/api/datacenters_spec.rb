require 'spec_helper'

describe Smartdc::Api::Datacenters do

  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".read" do
    it "return a datacenter" do
      @object.stub(:content) {fixture('datacenter')}
      name = fixture('datacenters').first[0]
      @request.stub_chain(:new, :get).with('my/datacenters/' + name) {@object}

      datacenters = Smartdc::Api::Datacenters.new({})
      expect(datacenters.read(name).content['message']).to match(/#{name}/)
    end
  end

  describe ".all" do
    it "return some datacenter" do
      @object.stub(:content) {fixture('datacenters')}
      @request.stub_chain(:new, :get).with('my/datacenters', {}) {@object}

      datacenters = Smartdc::Api::Datacenters.new({})
      expect(datacenters.all.content.count).to be > 0
    end
  end

end
