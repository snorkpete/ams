
class DevicesController < ApplicationController
  #before_action :set_announcement, only: [:register]

  # POST /devices/register
  def register
    respond_to do |format|
      
      registration_service = DeviceRegistrationService.new
      reg_response = registration_service.register(registration_params)

      if @reg_response
        format.json { render json: reg_response, status: :created }
      else
        format.json { render json: reg_response, status: :unprocessable_entity }
      end
    end
  end
  #

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:regid, :name, :email)
    end
end
