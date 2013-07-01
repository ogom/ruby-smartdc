require 'spec_helper'

describe Smartdc::Api::Packages do

  let(:object) {Object.new}
  let(:request) {Smartdc::Request}
  let(:packages) {Smartdc::Api::Packages.new({})}

  describe ".read" do
    it "return a package" do
      object.stub(:content) {fixture('packages')[0]}
      name = object.content['name']
      request.stub_chain(:new, :get).with('my/packages/' + name) {object}

      expect(packages.read(name).content['name']).to eq(name)
    end
  end

  describe ".all" do
    it "return some packages" do
      object.stub(:content) {fixture('packages')}
      request.stub_chain(:new, :get).with('my/packages', {}) {object}

      expect(packages.all.content.count).to be > 1
    end
  end

end
