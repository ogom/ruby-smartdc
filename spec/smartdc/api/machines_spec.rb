require 'spec_helper'

describe "Smartdc::Api::Machines" do
  describe ".find" do
    it "should return some machines" do
      client.machines.find.count.should > 0
    end
  end

  describe ".read" do
    it "should return a machine" do
      machines = client.machines.find
      client.machines.read(machines[0].id).id.should eq machines[0].id 
    end
  end
end