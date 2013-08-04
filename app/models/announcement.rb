class Announcement < ActiveRecord::Base

  def reset
    self.status = 'new'
    self.save
  end
end
