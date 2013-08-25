
class DevicesController < ApplicationController
  #before_action :set_announcement, only: [:register]

  before_filter :authenticate_user!, except: [:register]

  # cannot use the rails authentication token from android, so skip it for api registration requests
  skip_before_filter :verify_authenticity_token, only: [:register]
  
  # GET /device
  # GET /device.json
  def index
    @devices = Device.all
  end

  # POST /devices/register
  # TODO: move this function into its own separate API::Devices controller
  # API call - will only return json
  def register
      
     registration_service = DeviceRegistrationService.new
     registration_response = registration_service.register(registration_params)

     if registration_response[:success]
       render json: registration_response, status: :ok
     else
       render json: registration_response, status: :bad_request
     end
  end
  #

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      if params[:registration]
        params.require(:registration).permit(:regid, :name, :email) 
      else
        { }
      end
    end
end
