require 'spec_helper'

describe "Smartdc::Api::Machines" do
  
  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".create" do
    it "should return a machine" do
      @object.stub(:content) {fixture('machines')[0]}
      machine = @object.content
      @request.stub_chain(:new, :post).with('my/machines/', machine) {@object}

      machines = Smartdc::Api::Machines.new({})
      machines.create(machine).content['name'].should == machine['name']
    end
  end

  describe ".read" do
    it "should return a machine" do
      @object.stub(:content) {fixture('machines')[0]}
      name = @object.content['name']
      @request.stub_chain(:new, :get).with('my/machines/' + name) {@object}

      machines = Smartdc::Api::Machines.new({})
      machines.read(name).content['name'].should == name
    end
  end

  describe ".all" do
    it "should return some machines" do
      @object.stub(:content) {fixture('machines')}
      @request.stub_chain(:new, :get).with('my/machines', {}) {@object}

      machines = Smartdc::Api::Machines.new({})
      machines.all.content.count.should > 0
    end
  end

  describe ".delete" do
    it "should return true when success" do
      machine = fixture('machines')[0]
      @object.stub(:status) {204}
      @request.stub_chain(:new, :del).with('my/machines/' + machine['name']) {@object}

      machines = Smartdc::Api::Machines.new({})
      machines.destroy(machine['name']).status.should == 204
    end
  end

end