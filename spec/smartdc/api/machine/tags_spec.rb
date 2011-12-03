require 'spec_helper'

describe "Smartdc::Api::Machine::Tags" do
  before(:all) do
    @name = UUID.new.generate
    machine = {
      'name'    => @name,
      'dataset' => client.datasets.find[0].urn
    }
    @machine = client.machines.create machine
    @fixture = fixture('tag')
  end

  describe ".create" do
    it "should return a tag" do
      tag = client.machines(@machine.id).tags.create @fixture
      tag.name.should eq @fixture['name']
    end
  end

  describe ".read" do
    it "should return a tag" do
      client.machines(@machine.id).tags('name').read.should eq @fixture['name']
    end
  end

  describe ".find" do
    it "should return some tags" do
      client.machines(@machine.id).tags.find.count.should > 0
    end
  end

  describe ".delete" do
    it "should return true when success" do
      client.machines(@machine.id).tags('name').delete.should be_true
    end
  end

  after(:all) do
    machine = client.machines(@machine.id)
    machine.stop
    8.times do |i|
      break if machine.read.state == 'stopped'
      sleep i
    end
    client.machines(@machine.id).delete
  end
end