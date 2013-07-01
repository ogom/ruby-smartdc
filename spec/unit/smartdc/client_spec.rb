require 'spec_helper'

describe "Smartdc::Client" do
  describe ".keys" do
    it "should return a Smartdc::Api::Keys" do
      Smartdc::Client.new.keys.should be_a Smartdc::Api::Keys
    end
  end

  describe ".datacenters" do
    it "should return a Smartdc::Api::Datacenters" do
      Smartdc::Client.new.datacenters.should be_a Smartdc::Api::Datacenters
    end
  end

  describe ".datasets" do
    it "should return a Smartdc::Api::Datasets" do
      Smartdc::Client.new.datasets.should be_a Smartdc::Api::Datasets
    end
  end

  describe ".packages" do
    it "should return a Smartdc::Api::Packages" do
      Smartdc::Client.new.packages.should be_a Smartdc::Api::Packages
    end
  end

  describe ".machines" do
    it "should return a Smartdc::Api::Machines" do
    	Smartdc::Client.new.machines.should be_a Smartdc::Api::Machines
    end
  end

  describe ".analytics" do
    it "should return a Smartdc::Api::Analytics" do
      Smartdc::Client.new.analytics.should be_a Smartdc::Api::Analytics
    end
  end
end
