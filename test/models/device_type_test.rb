require 'test_helper'

class DeviceTypeTest < ActiveSupport::TestCase
  context "#notify" do

    setup do
      @device_type = create(:device_type)
    end

    should "be called after_updating the instance" do
      mock(@device_type).notify {}
      @device_type.update_attributes name: 'new value'
    end

    should "cascade up notify call on any device that uses it" do
      device = create(:device)
      mock.instance_of(Device).notify {}
      device_type = device.device_type
      device_type.update_attributes name: 'new value'
    end

  end
end
