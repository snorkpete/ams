require 'spec_helper'

describe "Devices" do
  describe "POST /register" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post register_devices_path
      response.status.should be(200)
    end
  end
end
