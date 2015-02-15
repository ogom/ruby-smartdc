require 'spec_helper'

describe Smartdc::Api::Machines::Snapshots do
  let(:snapshot) { { name: 'example' } }
  let(:id) do
    VCR.use_cassette('machines/index') { Smartdc.machines.content.first['id'] }
  end

  describe ".create_machine_snapshot", vcr: { cassette_name: 'machines/snapshots/create' } do
    it "creates a new machine snapshot" do
      expect(Smartdc.create_machine_snapshot(id, snapshot).content.count).to be > 0
    end
  end

  describe ".machine_snapshots", vcr: { cassette_name: 'machines/snapshots/index' } do
    it "receives list of machine snapshots" do
      expect(Smartdc.machine_snapshots(id).content.count).to be > 0
    end
  end

  describe ".machine_snapshot", vcr: { cassette_name: 'machines/snapshots/show' } do
    it "receives a machine snapshot" do
      expect(Smartdc.machine_snapshot(id, snapshot[:name]).content['name']).to eq(snapshot[:name])
    end
  end

  describe ".start_machine_snapshot", vcr: { cassette_name: 'machines/snapshots/start' } do
    it "starts a machine snapshot" do
      expect(Smartdc.start_machine_snapshot(id, snapshot[:name]).status).to eq(202)
    end
  end

  describe ".destroy_machine_snapshot", vcr: { cassette_name: 'machines/snapshots/destroy' } do
    it "removes a machine snapshot" do
      expect(Smartdc.destroy_machine_snapshot(id, snapshot[:name]).status).to eq(204)
    end
  end
end
