class DeviceTypeControlAssociation < ActiveRecord::Base
  belongs_to :device_type
  belongs_to :control
end
