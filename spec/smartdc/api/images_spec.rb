require 'spec_helper'

describe Smartdc::Api::Images do
  describe ".images", vcr: { cassette_name: 'images/index' } do
    it "receives list of images" do
      expect(Smartdc.images.content.count).to be > 0
    end
  end

  describe ".image", vcr: { cassette_name: 'images/show' } do
    let(:id) do
      VCR.use_cassette('images/index') { Smartdc.images.content.first['id'] }
    end

    it "receives a image" do
      expect(Smartdc.image(id).content['id']).to eq(id)
    end
  end
end
