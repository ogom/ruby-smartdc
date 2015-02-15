require 'spec_helper'

describe Smartdc::Client do
  let(:client) { Smartdc::Client.new }

  describe "#request_options" do
    it "receives some options" do
      expect(client.request_options.keys.count).to be > 0
    end
  end
end
