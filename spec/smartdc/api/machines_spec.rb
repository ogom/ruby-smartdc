require 'spec_helper'

describe Smartdc::Api::Machines do
  describe ".create_machine", vcr: { cassette_name: 'machines/create' } do
    let(:machine) do
      {
        name:    'example',
        image:   '62f148f8-6e84-11e4-82c5-efca60348b9f',
        package: 'd71da280-92da-489f-9c4c-c91891fa202f'
      }
    end

    it "creates a new machine" do
      expect(Smartdc.create_machine(machine).content['name']).to eq(machine[:name])
    end
  end

  describe ".machines", vcr: { cassette_name: 'machines/index' } do
    it "receives list of machines" do
      expect(Smartdc.machines.content.count).to be > 0
    end
  end

  context "machine exists" do
    let(:id) do
      VCR.use_cassette('machines/index') { Smartdc.machines.content.first['id'] }
    end

    describe ".machine", vcr: { cassette_name: 'machines/show' } do
      it "receives a machine" do
        expect(Smartdc.machine(id).content['id']).to eq(id)
      end
    end

    describe ".stop_machine", vcr: { cassette_name: 'machines/stop' } do
      it "stops a machine" do
        expect(Smartdc.stop_machine(id).status).to eq(202)
      end
    end

    describe ".start_machine", vcr: { cassette_name: 'machines/start' } do
      it "starts a machine" do
        expect(Smartdc.start_machine(id).status).to eq(202)
      end
    end

    describe ".reboot_machine", vcr: { cassette_name: 'machines/reboot' } do
      it "reboots a machine" do
        expect(Smartdc.reboot_machine(id).status).to eq(202)
      end
    end

    describe ".destroy_machine", vcr: { cassette_name: 'machines/destroy' } do
      it "removes a machine" do
        expect(Smartdc.destroy_machine(id).status).to eq(204)
      end
    end
  end
end
