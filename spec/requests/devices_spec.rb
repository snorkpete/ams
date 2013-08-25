require 'spec_helper'

describe "Devices" do
  describe "POST /register" do
    it "is not permitted without valid registration parameters" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post register_devices_path
      response.status.should be(400)
    end
  end
end
