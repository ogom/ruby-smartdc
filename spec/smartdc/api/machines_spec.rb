require 'spec_helper'

describe "Smartdc::Api::Machines" do
  before(:all) do
    @name = UUID.new.generate
    machine = {
      'name'    => @name,
      'dataset' => client.datasets.find[0].urn
    }
    @machine = client.machines.create machine
  end

  describe ".create" do
    it "should return a machine" do
      @machine.name.should eq @name
    end
  end

  describe ".read" do
    it "should return a machine" do
      client.machines(@machine.id).read.name.should eq @name
    end

    it "should return state at running when success" do
      machine = client.machines(@machine.id)
      8.times do |i|
        break if machine.read.state == 'running'
        sleep i
      end
      machine.read.state.should eq 'running'
    end
  end

  describe ".find" do
    it "should return some machines" do
      client.machines.find.count.should > 0
    end
  end

  describe ".stop" do
    it "should return true when success" do
      client.machines(@machine.id).stop.should be_true
    end

    it "should return state at stopped when success" do
      machine = client.machines(@machine.id)
      8.times do |i|
        break if machine.read.state == 'stopped'
        sleep i
      end
      machine.read.state.should eq 'stopped'
    end
  end

  describe ".start" do
    it "should return true when success" do
      client.machines(@machine.id).start.should be_true
    end

    it "should return state at running when success" do
      machine = client.machines(@machine.id)
      8.times do |i|
        break if machine.read.state == 'running'
        sleep i
      end
      machine.read.state.should eq 'running'
    end
  end

  describe ".reboot" do
    it "should return true when success" do
      client.machines(@machine.id).reboot.should be_true
    end

    it "should return state at running when success" do
      machine = client.machines(@machine.id)
      8.times do |i|
        break if machine.read.state == 'stopped'
        sleep i
      end
      
      8.times do |i|
        break if machine.read.state == 'running'
        sleep i
      end
      machine.read.state.should eq 'running'
    end
  end

  describe ".delete" do
    it "should return true when success" do
      machine = client.machines(@machine.id)
      machine.stop
      8.times do |i|
        break if machine.read.state == 'stopped'
        sleep i
      end
      client.machines(@machine.id).delete.should be_true
    end
  end
end