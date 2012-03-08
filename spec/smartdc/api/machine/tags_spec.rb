require 'spec_helper'

describe "Smartdc::Api::Machine::Tags" do
  before(:all) do
    @fixture = fixture('tag')
    @name = UUID.new.generate
    client.datasets.find.each do |dataset|
      if dataset.type == "smartmachine"
        @dataset_urn = dataset.urn
        break
      end
    end

    machine = {
      'name'    => @name,
      'dataset' => @dataset_urn
    }
    @machine = client.machines.create machine
    machine = client.machines(@machine.id)
    88.times do |i|
      break if machine.read.state == 'running'
      sleep i
    end
    88.times do |i|
      break if machine.read.state == 'running'
      sleep i
    end
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
      client.machines(@machine.id).tags('name').delete.should be_nil
    end
  end

  after(:all) do
    sleep 8
    machine = client.machines(@machine.id)
    machine.stop
    88.times do |i|
      break if machine.read.state == 'stopped'
      sleep i
    end
    client.machines(@machine.id).delete
  end
end