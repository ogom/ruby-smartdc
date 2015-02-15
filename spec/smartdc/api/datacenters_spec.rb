require 'spec_helper'

describe Smartdc::Api::Datacenters do
  describe ".datacenters", vcr: { cassette_name: 'datacenters/index' } do
    it "receives list of datacenters" do
      expect(Smartdc.datacenters.content.count).to be > 0
    end
  end

  describe ".datacenter", vcr: { cassette_name: 'datacenters/show' } do
    let(:name) do
      VCR.use_cassette('datacenters/index') { Smartdc.datacenters.content.first[0] }
    end

    it "receives a datacenter" do
      expect(Smartdc.datacenter(name).content['message']).to match(/#{name}/)
    end
  end
end
