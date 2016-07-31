module ProtocolLogger

  def log(old_value, device_control_value)
    logger.info(general_message(old_value, device_control_value))
  end

  def general_message(old_value, device_control_value)
    command = case device_control_value.device.device_type.name
              when /sony/i
                sony_command(old_value, device_control_value)
              when /samsung/i
                samsung_command(old_value, device_control_value)
              else
                standard_command(old_value, device_control_value)
              end
    device = device_control_value.device
    device_type = device.device_type
    control = device_control_value.control
    new_value = device_control_value.value
    control_name = control.display_name.parameterize.underscore
    "device id #{device.id}, type #{device_type.name}, changed #{control_name} from #{old_value} to #{new_value}, command to send = #{command}"
  end

  private
  def url_command(device_control_value)
    "http://#{device_control_value.device.ip_address}/"
  end

  def control_name(device_control_value)
    device_control_value.control.display_name.parameterize.underscore
  end

  def samsung_command(old_value, device_control_value)
    url_command(device_control_value) +
      "command=\"set#{control_name(device_control_value)}\"value=\"#{device_control_value.value}\""
  end

  def sony_command(old_value, device_control_value)
    url_command(device_control_value) +
      "#{control_name(device_control_value)}/#{device_control_value.value}"
  end

  def standard_command(old_value, device_control_value)
    url_command(device_control_value) +
      "command?#{control_name(device_control_value)}=#{device_control_value.value}"
  end
end
