require 'spec_helper'

describe Smartdc::Auth do
  let(:sdccfg) do
    {
      username: 'user',
      use_key:  '4c:02:f3:b2:09:fb:29:dd:41:97:da:80:bc:69:6c:f8',
      rsa_path: './spec/fixtures/ssh'
    }
  end

  let(:auth) { Smartdc::Auth.new(sdccfg) }

  describe ".fingerprint" do
    it "receives a key" do
      expect(auth.fingerprint(File.join(sdccfg[:rsa_path], 'id_rsa'))).to eq sdccfg[:use_key]
    end
  end

  describe ".signature" do
    it "receives a key" do
      expect(auth.signature('2014-03-21 12:34:56 UTC')).to eq "Signature keyId=\"/user/keys/4c:02:f3:b2:09:fb:29:dd:41:97:da:80:bc:69:6c:f8\",algorithm=\"rsa-sha256\" uy0srn/148hvxm6KH9tCjI0hFrJsrWDDR4+TEB4qzOmENc7pARxfFFU+eDQS9svrWVSJ84YsDu3Utdn4w7AtyucOeKB36fvxdgiFJFTxdYITlh+w7tKvEdjMzahjhFJmGzjgvWmHWyvE29O76lkXMDpPOp4F5QqjDGc3Qrs07RhHo2FlzPbOTc16yF/S/d7g+0spB/xO7gSyckRxgb3ngxk011eAvyJxsJMecrGWP7J65AfjI2bygI4GnXbeH2RxmGTX0g6iz8ez820rj11CaUoxxq47z/GQUDOuGixbCgEo1ORC/Smh8h4TS2phwe8g5j2d/5H5LJJAgtL4hN26iQ=="
    end
  end
end
