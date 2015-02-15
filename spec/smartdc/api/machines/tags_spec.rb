require 'spec_helper'

describe Smartdc::Api::Machines::Tags do
  let(:id) do
    VCR.use_cassette('machines/index') { Smartdc.machines.content.first['id'] }
  end

  describe ".create_machine_tag", vcr: { cassette_name: 'machines/tags/create' } do
    let(:tag) { { key: :value } }

    it "creates a new machine tag" do
      expect(Smartdc.create_machine_tag(id, tag).content.count).to be > 0
    end
  end

  describe ".machine_tags", vcr: { cassette_name: 'machines/tags/index' } do
    it "receives list of machine tags" do
      expect(Smartdc.machine_tags(id).content.count).to be > 0
    end
  end

  describe ".machine_tag", vcr: { cassette_name: 'machines/tags/show' } do
    it "receives a machine tag" do
      expect(Smartdc.machine_tag(id, 'key').content).to eq('"value"')
    end
  end

  describe ".destroy_machine_tag", vcr: { cassette_name: 'machines/tags/destroy' } do
    it "removes a machine tag" do
      expect(Smartdc.destroy_machine_tag(id, 'key').status).to eq(204)
    end
  end
end
