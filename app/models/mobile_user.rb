class MobileUser < ActiveRecord::Base
  has_one :device

  def regid
    return '' unless device

    device.regid
  end

  def regid= new_reg_id

    actual_device = device || Device.new(mobile_user_id: self.id)

    actual_device.regid = new_reg_id
    actual_device.save!
  end
end
