require 'spec_helper'

describe "Smartdc::Api::Machine::Metadata" do
  before(:all) do
    @fixture = fixture('tag')
    @name = UUID.new.generate
    machine = {
      'name'    => @name,
      'dataset' => client.datasets.find[0].urn
    }
    @machine = client.machines.create machine
    machine = client.machines(@machine.id)
    8.times do |i|
      break if machine.read.state == 'running'
      sleep i
    end
  end

  describe ".create" do
    it "should return a tag" do
      tag = client.machines(@machine.id).metadata.create @fixture
      tag.name.should eq @fixture['name']
    end
  end

  describe ".find" do
    it "should return some metadata" do
      client.machines(@machine.id).metadata.find.count.should > 0
    end
  end

  describe ".delete" do
    it "should return true when success" do
      client.machines(@machine.id).metadata('name').delete.should be_true
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