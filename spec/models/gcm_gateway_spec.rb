#require 'app/models/gcm'
require 'spec_helper'

describe 'GcmGateway' do

  it 'makes a simple request' do
    regid = 'APA91bE1DYm3n09KQQ9MGSkLJYeXt5lKMEhIYcPkYuXWw7jwb-24BkF7g8oI-IhyPQgznr61vBgcYAox_pLV32zH_OOK7E75XR-zRUIpNf7A5tGuEovm_ldOItX2JPyZAwcmcCg3vtxIeZfUXPntp_2qzMDZxg8IvQ'
    announcement = {}
    gateway = GcmGateway.new 
    gateway.announcements = { announcement: 'This better work, goddammit' }
    gateway.device_ids = [regid]
    expect(gateway.send_notification).to eq('x')
  end
end
