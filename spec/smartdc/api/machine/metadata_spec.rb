require 'spec_helper'

describe Smartdc::Api::Machine::Metadata do

  let(:object) {Object.new}
  let(:request) {Smartdc::Request}
  let(:metadata) {Smartdc::Api::Machine::Metadata.new('id', {})}

  describe ".create" do
    it "creates a metadata" do
      object.stub(:content) {fixture('tag')}
      tag = object.content
      request.stub_chain(:new, :post).with('my/machines/id/metadata/', tag) {object}

      expect(metadata.create(tag).content).to eq(tag)
    end
  end

  describe ".read" do
    it "return some metadata" do
      object.stub(:content) {fixture('tag')}
      request.stub_chain(:new, :get).with('my/machines/id/metadata', {}) {object}

      expect(metadata.read.content.count).to be > 0
    end
  end

  describe ".destroy" do
    it "return a metadata" do
      object.stub(:status) {204}
      key = fixture('tag').first[0]
      request.stub_chain(:new, :del).with('my/machines/id/metadata/' + key) {object}

      expect(metadata.destroy(key).status).to eq(204)
    end
  end

end
