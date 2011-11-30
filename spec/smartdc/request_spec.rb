require 'spec_helper'

describe "Smartdc::Request" do
  describe "http response status" do
    it "should return a response status" do
      request = Smartdc::Request.new(fixture('config', 'config'))
      request.get('/')
      request.response.status.should be(200)
    end
  end
end