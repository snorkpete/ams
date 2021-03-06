
class AnnouncementsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_announcement, only: [:show, :edit, :push, :reset, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.all
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
  end
  
  # POST /announcements/1/push
  def push
    respond_to do |format|
      # push announcement here using GCM
      gateway = GcmGateway.new
      @gcm_response = gateway.send_notification(@announcement) 
      if @gcm_response
        format.html { redirect_to @announcement, notice: 'Announcement was sent to all registered devices.' }
      else
        format.html { render action: 'show', error:'Announcement not sent' }
      end
    end
  end
  #
  # POST /announcements/1/reset
  def reset
    respond_to do |format|
      if @announcement.reset
        format.html { redirect_to @announcement, notice: 'Announcement status reset.' }
      else
        format.html { render action: 'show', error:'Announcement not reset.' }
      end
    end
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @announcement }
      else
        format.html { render action: 'new' }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:description, :details, :status)
    end
end
