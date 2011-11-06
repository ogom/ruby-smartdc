require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Smartdc" do
  describe ".new" do
    it "should return a Smartdc::Client" do
      Smartdc.new.should be_a Smartdc::Client
    end
  end
end