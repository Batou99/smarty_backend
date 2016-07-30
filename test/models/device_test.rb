require 'test_helper'

class DeviceTest < ActiveSupport::TestCase

  context "#reset_data" do

    setup do
      @device = create(:device)
    end

    should "be called after_updating the instance" do
      mock(@device).reset_data {}
      @device.update_attributes name: 'new value'
    end

  end
end
