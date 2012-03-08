require 'spec_helper'

describe "Smartdc::Api::Keys" do
  before(:all) do
    @key = fixture('key')
  end

  describe ".create" do
    it "should return a key" do
      key = client.keys.create @key
      key.name.should eq @key['name']
    end
  end

  describe ".read" do
    it "should return a key" do
      client.keys(@key['name']).read.name.should eq @key['name']
    end
  end

  describe ".find" do
    it "should return some keys" do
      client.keys.find.count.should > 0
    end
  end

  describe ".delete" do
    it "should return true when success" do
      client.keys(@key['name']).delete.should be_nil
    end
  end
end