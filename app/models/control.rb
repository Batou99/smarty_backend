class Control < ActiveRecord::Base

  belongs_to :ui_control
  has_many :device_type_control_associations
  has_many :devices_types, through: :device_type_control_associations, source: :device_type

  validates :display_name, uniqueness: true, presence: true
  validates :ui_control, presence: true

  after_update :notify

  def notify
    devices_types.map(&:notify)
  end
end
