require 'test_helper'

class UiControlTest < ActiveSupport::TestCase

  context "validation" do

    setup do
      @ui_control = build(:ui_control)
    end

    should "be valid if default_value is included in values" do
      @ui_control.default_value = @ui_control.values.first
      assert @ui_control.valid?
    end

    should "be invalid if default_value is not included in values" do
      @ui_control.default_value = 'Fake'
      assert !@ui_control.valid?
    end

  end

  context "#notify" do

    setup do
      @ui_control = create(:ui_control)
    end

    should "be called after_updating the instance" do
      mock(@ui_control).notify {}
      @ui_control.update_attributes kind: 'new value'
    end

    should "cascade up notify call on any device that uses it" do
      device = create(:device)
      mock.instance_of(Device).notify {}
      ui_control = device.device_type.controls.first.ui_control
      ui_control.update_attributes kind: 'new value'
    end

  end

end
