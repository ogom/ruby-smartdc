
require 'spec_helper'

describe "Smartdc::Api::Machine::Snapshots" do
  
  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".create" do
    it "should return a snapshot" do
      @object.stub(:content) {fixture('snapshots')[0]}
      snapshot = @object.content
      @request.stub_chain(:new, :post).with('my/machines/id/snapshots/', snapshot) {@object}

      snapshots = Smartdc::Api::Machine::Snapshots.new('id', {})
      snapshots.create(snapshot).content['name'].should == snapshot['name']
    end
  end

  describe ".read" do
    it "should return a snapshot" do
      @object.stub(:content) {fixture('snapshots')[0]}
      name = @object.content['name']
      @request.stub_chain(:new, :get).with('my/machines/id/snapshots/' + name) {@object}

      snapshots = Smartdc::Api::Machine::Snapshots.new('id', {})
      snapshots.read(name).content['name'].should == name
    end
  end

  describe ".all" do
    it "should return some snapshots" do
      @object.stub(:content) {fixture('snapshots')}
      @request.stub_chain(:new, :get).with('my/machines/id/snapshots', {}) {@object}

      snapshots = Smartdc::Api::Machine::Snapshots.new('id', {})
      snapshots.all.content.count.should > 0
    end
  end

  describe ".delete" do
    it "should return a snapshot" do
      @object.stub(:status) {204}
      name = fixture('snapshots')[0]['name']
      @request.stub_chain(:new, :del).with('my/machines/id/snapshots/' + name) {@object}

      snapshots = Smartdc::Api::Machine::Snapshots.new('id', {})
      snapshots.destroy(name).status.should == 204
    end
  end

end








# require 'spec_helper'

# describe "Smartdc::Api::Machine::Snapshots" do
#   before(:all) do
#     @fixture = fixture('tag')
#     @name = UUID.new.generate
#     client.datasets.find.each do |dataset|
#       if dataset.type == "smartmachine"
#         @dataset_urn = dataset.urn
#         break
#       end
#     end

#     machine = {
#       'name'    => @name,
#       'dataset' => @dataset_urn
#     }
#     @machine = client.machines.create machine
#     machine = client.machines(@machine.id)
#     88.times do |i|
#       break if machine.read.state == 'running'
#       sleep i
#     end
#     88.times do |i|
#       break if machine.read.state == 'running'
#       sleep i
#     end
#     machine.stop
#     88.times do |i|
#       break if machine.read.state == 'stopped'
#       sleep i
#     end
#   end

#   describe ".create" do
#     it "should return a snapshot" do
#       snapshot = client.machines(@machine.id).snapshots.create @fixture
#       snapshot.name.should eq @fixture['name']
#     end
#   end

#   describe ".read" do
#     it "should return a snapshot" do
#       client.machines(@machine.id).snapshots('sample').read.name.should eq @fixture['name']
#     end
#   end

#   describe ".find" do
#     it "should return some snapshots" do
#       client.machines(@machine.id).snapshots.find.count.should > 0
#     end
#   end

#   describe ".delete" do
#     it "should return true when success" do
#       client.machines(@machine.id).snapshots('sample').delete.should be_nil
#     end
#   end

#   after(:all) do
#     sleep 8
#     machine = client.machines(@machine.id)
#     machine.stop
#     88.times do |i|
#       break if machine.read.state == 'stopped'
#       sleep i
#     end
#     client.machines(@machine.id).delete
#   end
# end