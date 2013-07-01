require 'spec_helper'

describe Smartdc::Api::Analytics do

  let(:object) {Object.new}
  let(:request) {Smartdc::Request}
  let(:analytics) {Smartdc::Api::Analytics.new({})}

  describe ".create" do
    it "creates a instrumentation" do
      object.stub(:content) {fixture('analytics')[0]}
      analytic = object.content
      request.stub_chain(:new, :post).with('my/analytics/instrumentations/', analytic) {object}

      expect(analytics.create(analytic).content['id']).to eq(analytic['id'])
    end
  end

  describe ".read" do
    it "return a instrumentation" do
      object.stub(:content) {fixture('analytics')[0]}
      id = object.content['id']
      request.stub_chain(:new, :get).with('my/analytics/instrumentations/' + id) {object}

      expect(analytics.read(id).content['id']).to eq(id)
    end
  end

  describe ".all" do
    it "return some instrumentations" do
      object.stub(:content) {fixture('analytics')}
      request.stub_chain(:new, :get).with('my/analytics/instrumentations', {}) {object}

      expect(analytics.all.content.count).to be > 0
    end
  end

  describe ".destroy" do
    it "return true when success" do
      analytic = fixture('analytics')[0]
      object.stub(:status) {204}
      request.stub_chain(:new, :del).with('my/analytics/instrumentations/' + analytic['id']) {object}

      expect(analytics.destroy(analytic['id']).status).to eq(204)
    end
  end

end
