require 'spec_helper'

describe "Smartdc::Api::Packages" do
  describe ".find" do
    it "should return some packages" do
      client.packages.find.count.should > 0
    end
  end

  describe ".read" do
    it "should return a dataset" do
      packages = client.packages.find
      client.packages(packages[0].name).read.name.should eq packages[0].name
    end
  end
end