class Api::V1::AnnouncementsController < ApplicationController
  def index

    unless params[:last_date]
      @announcements = [] 
      return
    end

    last_time_in_secs = params[:last_date].to_i / 1000.0 + 10

    @announcements = Announcement.where('created_at > ?', Time.at(last_time_in_secs))

    respond_to do |format|
      format.json { render json: @announcements }
    end
  end

  def search_params
    params.permit(:last_date)
  end
end
