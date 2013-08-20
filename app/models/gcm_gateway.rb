class GcmGateway

  #attr_accessor :announcement_text, :announcement_details, :device_ids

  def send_notification(announcement)
    GCM.key = "AIzaSyB4o0cy3akF1BViFaDE1Ld-kN_0kqlGEQ0"

    regid = 'APA91bE1DYm3n09KQQ9MGSkLJYeXt5lKMEhIYcPkYuXWw7jwb-24BkF7g8oI-IhyPQgznr61vBgcYAox_pLV32zH_OOK7E75XR-zRUIpNf7A5tGuEovm_ldOItX2JPyZAwcmcCg3vtxIeZfUXPntp_2qzMDZxg8IvQ'

    announcement = { 
                     announcement_text: announcement.description, 
                     announcement_details:announcement.details,
                     announcement_id:announcement.id
                    }

    device_ids = [regid]

    #destination = ["device1", "device2", "device3"]
    # can be an string or an array of strings containing the regIds of the devices you want to send

    #data = {:key => "value", :key2 => ["array", "value"]}
    # must be an hash with all values you want inside you notification

    #GCM.send_notification( destination, data )

    GCM.send_notification(device_ids, announcement)
  end
end
