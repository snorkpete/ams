require 'spec_helper'

describe DevicesController do

  describe "POST 'register'" do

    context "when invoked with required params" do
      it "returns :200 success" do
        post :register, registration: { name:'test', email:'test', regid:'test' }
        expect(response.status).to eq(200)
      end
    end

    context "when invoked without required params" do
      it "returns :400 invalid request" do
        post :register, registration: { name:'test'  }
        expect(response.status).to eq(400)
      end
    end

    context "when invoked without registration grouping param" do
      it "returns :400 invalid request" do
        post :register
        expect(response.status).to eq(400)
      end
    end
  end

end
