require 'test_helper'

class DeviceTest < ActiveSupport::TestCase

  context "#reset_data" do

    setup do
      @device = create(:device).reload
      @device_control_values = @device.device_control_values
    end

    should "be called after_updating the instance" do
      mock(@device).reset_data! {}
      @device_type = create(:device_type)
      @device.update_attributes device_type: @device_type
    end

    should "be called on creating a new object" do
      mock.instance_of(Device).reset_data! {}
      create(:device)
    end

    should "create a new set of device_control_values" do
      assert_equal 1, @device_control_values.size
      assert_equal 0, @device_control_values.first.value
    end

    should "swap all device_control_values" do
      dcv = @device.device_control_values.first
      dcv.update_attributes value: 1
      # Value we set
      assert_equal 1, @device.reload.device_control_values.first.value
      @device.reset_data!
      # Back to default data
      assert_equal 0, @device.reload.device_control_values.first.value
    end

  end
end
