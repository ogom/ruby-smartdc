require 'spec_helper'

describe Smartdc::Api::Machine::Tags do
  
  let(:object) {Object.new}
  let(:request) {Smartdc::Request}
  let(:tags) {Smartdc::Api::Machine::Tags.new('id', {})}

  describe ".create" do
    it "creates a tag" do
      object.stub(:content) {fixture('tag')}
      tag = object.content
      request.stub_chain(:new, :post).with('my/machines/id/tags/', tag) {object}

      expect(tags.create(tag).content).to eq(tag)
    end
  end

  describe ".read" do
    it "return a tag" do
      object.stub(:content) {fixture('tag')}
      key = object.content.first[0]
      request.stub_chain(:new, :get).with('my/machines/id/tags/' + key) {object}

      expect(tags.read(key).content.first[0]).to eq(key)
    end
  end

  describe ".all" do
    it "return some tags" do
      object.stub(:content) {fixture('tag')}
      request.stub_chain(:new, :get).with('my/machines/id/tags', {}) {object}

      expect(tags.all.content.count).to be > 0
    end
  end

  describe ".destroy" do
    it "return a tag" do
      object.stub(:status) {204}
      key = fixture('tag').first[0]
      request.stub_chain(:new, :del).with('my/machines/id/tags/' + key) {object}

      expect(tags.destroy(key).status).to eq(204)
    end
  end

end
