class Device < ActiveRecord::Base

  belongs_to :device_type

  validates :name, :device_type, presence: true
  validates :name, uniqueness: true
end
