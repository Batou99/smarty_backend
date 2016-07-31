class DeviceControlValuesController < ApplicationController

  respond_to :json

  def update
    dcv = DeviceControlValue.find_by_id(params[:id])
    if dcv
      set_value(dcv, params[:value])
      dcv.save
      render :json => {:status => "ok"}, :status => 200
    else
      render(:json => {:status => "error", :message => "DeviceControlValue not found"}, :status => 404)
    end
  end

  private

  def set_value(device_control_value, value)
    case device_control_value.control.ui_control.kind
    when 'button'
      device_control_value.value = value == ["on"] ? 1 : 0
    when 'select'
      device_control_value.value = value
    when 'slider'
      device_control_value.value = value.to_i
    end
  end
end
