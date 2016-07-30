class DeviceControlValue < ActiveRecord::Base

  belongs_to :device
  belongs_to :control

  validate :valid_value

  def valid_value
    valid_values = control.ui_control.values
    error_msg = "Invalid value, value must one of those: " + valid_values.to_s
    errors.add(:value, error_msg) unless valid_values.include? value
  end

  def value
    ActiveSupport::JSON.decode read_attribute(:value)
  end

  def value=(val)
    write_attribute(:value, ActiveSupport::JSON.encode(val))
  end
end
