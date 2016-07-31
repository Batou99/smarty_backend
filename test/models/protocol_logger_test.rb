class ProtocolLoggerTest < ActiveSupport::TestCase

  include ProtocolLogger

  context "Device type brand" do

    setup do
      @device = create(:device)
      @device.reload
      @volume = @device.device_type.controls.first
      @volume.update_attributes display_name: 'Volume'
      @dcv = @device.device_control_values.first
      @dcv.update_attributes value: 45
    end

    context "Samsung" do

      setup do
        @device.device_type.update_attributes name: 'Samsung Audio'
      end

      should "generate the proper command" do
        msg = "device id #{@device.id}, type Samsung Audio, changed volume from 27 to 45, " +
              "command to send = http://#{@device.ip_address}/command=\"setvolume\"value=\"45\""
        assert_equal msg, general_message(27, @dcv)
      end

    end

    context "Sony" do

      setup do
        @device.device_type.update_attributes name: 'Sony Audio'
      end

      should "generate the proper command" do
        msg = "device id #{@device.id}, type Sony Audio, changed volume from 27 to 45, " +
              "command to send = http://#{@device.ip_address}/volume/45"
        assert_equal msg, general_message(27, @dcv)
      end

    end

    context "Other" do

      setup do
        @device.device_type.update_attributes name: 'Apple TV'
      end

      should "generate the proper command" do
        msg = "device id #{@device.id}, type Apple TV, changed volume from 27 to 45, " +
              "command to send = http://#{@device.ip_address}/command?volume=45"
        assert_equal msg, general_message(27, @dcv)
      end

    end

  end

end
