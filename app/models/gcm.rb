class GCM

  def self.push(announcement)
    # push the message here
    #server = GCM.new

    #update the status of the announcement
    announcement.status = 'sent'
    announcement.save
  end

end
