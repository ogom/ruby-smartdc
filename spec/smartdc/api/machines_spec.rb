require 'spec_helper'

describe "Smartdc::Api::Machines" do
  before(:all) do
    @name = UUID.new.generate
    datasets = client.datasets.find
    machine = {
      'name'    => @name,
      'dataset' => datasets[0].urn
    }
    @machine = client.machines.create machine
  end

  describe ".create" do
    it "should return a key" do
      @machine.name.should eq @name
    end
  end

  describe ".read" do
    it "should return a machine" do
      client.machines.read(@machine.id).name.should eq @name
    end
  end

  describe ".find" do
    it "should return some machines" do
      client.machines.find.count.should > 0
    end
  end

  describe ".delete" do
    it "should return true when success" do
      client.machines.stop @machine.id
      client.machines.delete(@machine.id).should be_true
    end
  end
end