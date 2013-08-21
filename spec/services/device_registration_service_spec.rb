require 'spec_helper'

describe "DeviceRegistrationService" do
  let(:registration_service) { DeviceRegistrationService.new }

  describe "#register" do

    #it "accepts an email address, name and gcm registration id"

    context "when email address does not exist" do
      it "creates a new mobile user" do
        expect(MobileUser.count).to eq(0)

        registration_details = { email: 'test@test.com', name: 'Mike', regid: 'registrationid' }
        registration_service.register registration_details
        expect(MobileUser.count).to eq(1)
      end
    end

    context "when email address already exists" do

      before do
        @existing_email = 'iexist@already.com'
        @existing_user = MobileUser.create! email: @existing_email, name: 'mike'
      end

      it "does not create a new mobile user" do
        registration_details = { email: @existing_email, name: 'Mike', regid: 'registrationid' }

        expect(MobileUser.count).to eq(1) 
        registration_service.register registration_details
        expect(MobileUser.count).to eq(1) 
      end

      it "changes the gcm reg id for that mobile user's device" do
        @existing_user.device = Device.create! regid: 'original'
        expect(@existing_user.regid).to eq('original')

        registration_service.register name:'boo', email: @existing_email, regid: 'new'
        @existing_user.reload

        expect(@existing_user.regid).to eq('new')

      end
    end

  end
end
