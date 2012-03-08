require 'spec_helper'

describe "Smartdc::Request" do
  describe "http response status" do
    it "should return a response status" do
      request = Smartdc::Request.new(fixture('config', 'config'))
      expect{
        request.get('smartdc/')
      }.to raise_error(Smartdc::Error::NotFound)
    end
  end
end