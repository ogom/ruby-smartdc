require 'spec_helper'

describe Smartdc do
  describe ".new" do
    it "is a Smartdc::Client" do
      expect(Smartdc.new).to be_a Smartdc::Client
    end
  end
end
