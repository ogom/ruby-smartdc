require 'spec_helper'

describe Smartdc::Api::Packages do
  describe ".packages", vcr: { cassette_name: 'packages/index' } do
    it "receives list of packages" do
      expect(Smartdc.packages.content.count).to be > 0
    end
  end

  describe ".package", vcr: { cassette_name: 'packages/show' } do
    let(:id) do
      VCR.use_cassette('packages/index') { Smartdc.packages.content.first['id'] }
    end

    it "receives a package" do
      expect(Smartdc.package(id).content['id']).to eq(id)
    end
  end
end
