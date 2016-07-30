require "test_helper"

class DeviceControlValueTest < ActiveSupport::TestCase

  context "validation" do

    setup do
      @device = create(:device)
      @device_values = device.values
    end

  end
end
