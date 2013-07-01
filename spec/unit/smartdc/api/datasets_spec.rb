require 'spec_helper'

describe Smartdc::Api::Datasets do

  let(:object) {Object.new}
  let(:request) {Smartdc::Request}
  let(:datasets) {Smartdc::Api::Datasets.new({})}

  describe ".read" do
    it "return a dataset" do
      object.stub(:content) {fixture('datasets')[0]}
      id = object.content['id']
      request.stub_chain(:new, :get).with('my/datasets/' + id) {object}

      expect(datasets.read(id).content['id']).to eq(id)
    end
  end

  describe ".all" do
    it "return some datasets" do
      object.stub(:content) {fixture('datasets')}
      request.stub_chain(:new, :get).with('my/datasets', {}) {object}

      expect(datasets.all.content.count).to be > 0
    end
  end

end
