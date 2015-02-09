require 'spec_helper'

describe Smartdc::Client do
  describe ".keys" do
    it "is a Smartdc::Api::Keys" do
      expect(Smartdc::Client.new.keys).to be_a Smartdc::Api::Keys
    end
  end

  describe ".datacenters" do
    it "is a Smartdc::Api::Datacenters" do
      expect(Smartdc::Client.new.datacenters).to be_a Smartdc::Api::Datacenters
    end
  end

  describe ".datasets" do
    it "is a Smartdc::Api::Datasets" do
      expect(Smartdc::Client.new.datasets).to be_a Smartdc::Api::Datasets
    end
  end

  describe ".packages" do
    it "is a Smartdc::Api::Packages" do
      expect(Smartdc::Client.new.packages).to be_a Smartdc::Api::Packages
    end
  end

  describe ".machines" do
    it "is a Smartdc::Api::Machines" do
    	expect(Smartdc::Client.new.machines).to be_a Smartdc::Api::Machines
    end
  end

  describe ".analytics" do
    it "is a Smartdc::Api::Analytics" do
      expect(Smartdc::Client.new.analytics).to be_a Smartdc::Api::Analytics
    end
  end

end
