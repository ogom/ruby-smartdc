require 'spec_helper'

describe Smartdc::Api::Machine::Snapshots do
  
  let(:object) {Object.new}
  let(:request) {Smartdc::Request}
  let(:snapshots) {Smartdc::Api::Machine::Snapshots.new('id', {})}

  describe ".create" do
    it "creates a snapshot" do
      object.stub(:content) {fixture('snapshots')[0]}
      snapshot = object.content
      request.stub_chain(:new, :post).with('my/machines/id/snapshots/', snapshot) {object}

      expect(snapshots.create(snapshot).content['name']).to eq(snapshot['name'])
    end
  end

  describe ".read" do
    it "return a snapshot" do
      object.stub(:content) {fixture('snapshots')[0]}
      name = object.content['name']
      request.stub_chain(:new, :get).with('my/machines/id/snapshots/' + name) {object}

      expect(snapshots.read(name).content['name']).to eq(name)
    end
  end

  describe ".all" do
    it "return some snapshots" do
      object.stub(:content) {fixture('snapshots')}
      request.stub_chain(:new, :get).with('my/machines/id/snapshots', {}) {object}

      expect(snapshots.all.content.count).to be > 0
    end
  end

  describe ".destroy" do
    it "return a snapshot" do
      object.stub(:status) {204}
      name = fixture('snapshots')[0]['name']
      request.stub_chain(:new, :del).with('my/machines/id/snapshots/' + name) {object}

      expect(snapshots.destroy(name).status).to eq(204)
    end
  end

end
