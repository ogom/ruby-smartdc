require 'spec_helper'

describe "Smartdc::Api::Datasets" do
  describe ".find" do
    it "should return some datasets" do
      client.datasets.find.count.should > 0
    end
  end

  describe ".read" do
    it "should return a dataset" do
      datasets = client.datasets.find
      client.datasets.read(datasets[0].id).id.should eq datasets[0].id
    end
  end
end