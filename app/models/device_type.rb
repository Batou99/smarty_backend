class DeviceType < ActiveRecord::Base

  has_many :device_type_control_associations
  has_many :controls, through: :device_type_control_associations
  has_many :devices


  validates :name, uniqueness: true, presence: true

  after_update :notify

  def notify
    devices.map(&:notify)
  end
end
