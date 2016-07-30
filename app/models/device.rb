class Device < ActiveRecord::Base

  belongs_to :device_type
  has_many   :device_control_values

  validates :name, :device_type, presence: true
  validates :name, uniqueness: true

  after_save :reset_data!

  def notify
    reset_data!
  end

  def reset_data!
    device_control_values.destroy_all
    device_type.controls.each do |control|
      DeviceControlValue.create(device_id: id, control_id: control.id, value: control.ui_control.default_value)
    end
  end

end
