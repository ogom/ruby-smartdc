require 'spec_helper'

describe "Smartdc::Api::instrumentations" do
  before(:all) do
    @fixture = fixture('instrumentation')
    @instrumentation = client.analytics.instrumentations.create @fixture
  end

  describe ".create" do
    it "should return a instrumentation" do
      @instrumentation.module.should eq @fixture['module']
    end
  end

  describe ".read" do
    it "should return a instrumentation" do
      client.analytics.instrumentations(@instrumentation.id).read.module.should eq @fixture['module']
    end
  end

  describe ".find" do
    it "should return some instrumentations" do
      client.analytics.instrumentations.find.count.should > 0
    end
  end

  describe ".delete" do
    it "should return true when success" do
      client.analytics.instrumentations(@instrumentation.id).delete.should be_true
    end
  end
end