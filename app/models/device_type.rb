class DeviceType < ActiveRecord::Base

  has_many :device_type_control_associations
  has_many :controls, through: :device_type_control_associations
  has_many :devices

  validates :name, uniqueness: true, presence: true
end
