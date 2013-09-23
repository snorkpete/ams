require 'spec_helper'

describe Api::V1::AnnouncementsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'api/v1/announcements/1378686235000'
      response.should be_success
    end
  end

end
