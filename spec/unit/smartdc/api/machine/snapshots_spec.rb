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
