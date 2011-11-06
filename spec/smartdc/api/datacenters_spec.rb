require 'spec_helper'

describe "Smartdc::Api::Datacenters" do
  describe ".find" do
    it "should return some datacenters" do
      client.datacenters.find.count.should > 0
    end
  end

  describe ".read" do
    it "should return a datacenter" do
      datacenters = client.datacenters.find
      client.datacenters.read(datacenters.first[0])[:message].should match(/#{datacenters.first[0]}/)
    end
  end
end