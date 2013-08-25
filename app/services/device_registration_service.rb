class DeviceRegistrationService

  def register(details)
    name = details[:name]
    email = details[:email]
    regid = details[:regid]

    # ensure that the correct parameters were sent
    if name.blank? or email.blank? or regid.blank?
      return { success: false, msg: 'Invalid parameters' }
    end

    user = MobileUser.find_by_email(email)
    if user
      user.regid = regid
      user.save!
      msg = 'Registration updated'
    else
      user = MobileUser.create! name: name, email: email
      user.regid = regid
      user.save
      msg = 'New registration created.'
    end

    result = { success: :true, msg: msg }
  end
end
