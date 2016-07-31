class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :device_control_values

  def type
    object.device_type.name
  end

  def device_control_values
    object.device_control_values.map do |dcv|
      { 
        id:     dcv.id,
        name:   dcv.control.display_name,
        type:   dcv.control.ui_control.kind,
        value:  dcv.value,
        possible_values: dcv.control.ui_control.values
      }
    end
  end


end
