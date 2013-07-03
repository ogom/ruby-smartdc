require 'spec_helper'

describe Smartdc::Api::Datacenters do

  let(:object) {Object.new}
  let(:request) {Smartdc::Request}
  let(:datacenters) {Smartdc::Api::Datacenters.new({})}

  describe ".read" do
    it "returns a datacenter" do
      object.stub(:content) {fixture('datacenter')}
      name = fixture('datacenters').first[0]
      request.stub_chain(:new, :get).with('my/datacenters/' + name) {object}

      expect(datacenters.read(name).content['message']).to match(/#{name}/)
    end
  end

  describe ".all" do
    it "returns some datacenter" do
      object.stub(:content) {fixture('datacenters')}
      request.stub_chain(:new, :get).with('my/datacenters', {}) {object}

      expect(datacenters.all.content.count).to be > 0
    end
  end

end
