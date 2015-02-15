require 'spec_helper'

describe Smartdc::Api::Analytics do
  describe ".describe_analytics", vcr: { cassette_name: 'analytics/describe' } do
    it "receives list of analytic describe" do
      expect(Smartdc.describe_analytics.content.count).to be > 0
    end
  end

  describe ".create_analytic", vcr: { cassette_name: 'analytics/create' } do
    let(:analytic) { { module: 'syscall', stat: 'syscalls' } }

    it "creates a new analytic" do
      expect(Smartdc.create_analytic(analytic).content.count).to be > 0
    end
  end

  describe ".analytics", vcr: { cassette_name: 'analytics/index' } do
    it "receives list of analytics" do
      expect(Smartdc.analytics.content.count).to be > 0
    end
  end

  context "machine exists" do
    let(:id) do
      VCR.use_cassette('analytics/index') { Smartdc.analytics.content.first['id'] }
    end

    describe ".analytic", vcr: { cassette_name: 'analytics/show' } do
      it "receives a analytic" do
        expect(Smartdc.analytic(id).content['id']).to eq(id)
      end
    end

    describe ".value_analytic", vcr: { cassette_name: 'analytics/value' } do
      it "values a analytic" do
        expect(Smartdc.value_analytic(id).content['value']).to eq(0)
      end
    end

    describe ".destroy_analytic", vcr: { cassette_name: 'analytics/destroy' } do
      it "removes a analytic" do
        expect(Smartdc.destroy_analytic(id).status).to eq(204)
      end
    end
  end
end
