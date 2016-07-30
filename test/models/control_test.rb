require 'test_helper'

class ControlTest < ActiveSupport::TestCase

  context "#notify" do

    setup do
      @control = create(:control)
    end

    should "be called after_updating the instance" do
      mock(@control).notify {}
      @control.update_attributes display_name: 'new value'
    end

    should "cascade up notify call on any device that uses it" do
      device = create(:device)
      mock.instance_of(Device).notify {}
      control = device.device_type.controls.first
      control.update_attributes display_name: 'new value'
    end

  end
end
