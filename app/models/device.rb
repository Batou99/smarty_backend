class Device < ActiveRecord::Base

  belongs_to :device_type

  validates :name, :device_type, presence: true
  validates :name, uniqueness: true

  after_save :reset_data

  def notify
    reset_data
  end

  def reset_data

  end
end
