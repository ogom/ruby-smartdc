require 'spec_helper'

describe Smartdc::Api::Machines::Metadata do
  let(:id) do
    VCR.use_cassette('machines/index') { Smartdc.machines.content.first['id'] }
  end

  describe ".update_machine_metadata", vcr: { cassette_name: 'machines/metadata/update' } do
    let(:metadata) { { key: :value } }

    it "creates a new machine metadata" do
      expect(Smartdc.update_machine_metadata(id, metadata).content.count).to be > 0
    end
  end

  describe ".machine_metadata", vcr: { cassette_name: 'machines/metadata/index' } do
    it "receives list of machine metadata" do
      expect(Smartdc.machine_metadata(id).content.count).to be > 0
    end
  end

  describe ".destroy_machine_metadata", vcr: { cassette_name: 'machines/metadata/destroy' } do
    it "removes a machine metadata" do
      expect(Smartdc.destroy_machine_metadata(id, 'key').status).to eq(204)
    end
  end
end
