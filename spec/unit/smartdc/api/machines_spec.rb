require 'spec_helper'

describe Smartdc::Api::Machines do
  
  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".create" do
    it "creates a machine" do
      @object.stub(:content) {fixture('machines')[0]}
      machine = @object.content
      @request.stub_chain(:new, :post).with('my/machines/', machine) {@object}

      machines = Smartdc::Api::Machines.new({})
      expect(machines.create(machine).content['name']).to eq(machine['name'])
    end
  end

  describe ".read" do
    it "return a machine" do
      @object.stub(:content) {fixture('machines')[0]}
      name = @object.content['name']
      @request.stub_chain(:new, :get).with('my/machines/' + name) {@object}

      machines = Smartdc::Api::Machines.new({})
      expect(machines.read(name).content['name']).to eq(name)
    end
  end

  describe ".all" do
    it "return some machines" do
      @object.stub(:content) {fixture('machines')}
      @request.stub_chain(:new, :get).with('my/machines', {}) {@object}

      machines = Smartdc::Api::Machines.new({})
      expect(machines.all.content.count).to be > 1
    end
  end

  describe ".destroy" do
    it "return true when success" do
      machine = fixture('machines')[0]
      @object.stub(:status) {204}
      @request.stub_chain(:new, :del).with('my/machines/' + machine['name']) {@object}

      machines = Smartdc::Api::Machines.new({})
      expect(machines.destroy(machine['name']).status).to eq(204)
    end
  end

end
