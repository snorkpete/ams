class DeviceRegistrationService

  DEFAULT_PASSWORD = 'changeme'

  def register(details)
    name = details[:name]
    email = details[:email]
    regid = details[:regid]

    user = MobileUser.find_by_email(email)

    if user
      user.regid = regid
      user.save!
    else
      user = MobileUser.create! name: name, email: email
      user.regid = regid
      user.save
    end

    result = { success: :true }
  end
end
