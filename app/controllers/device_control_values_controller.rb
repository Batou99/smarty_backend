class DeviceControlValuesController < ApplicationController

  respond_to :json

  def update
    dcv = DeviceControlValue.find_by_id(params[:id])
    msg = "DeviceControlValue not found"
    render(json: { status: "error", message: msg }, status: 404) and return unless dcv
    old_value = dcv.value
    set_value(dcv, params[:value])
    if dcv.save
      logger.info("INFO **** #{dcv.control.display_name} changed from #{old_value} to #{dcv.value} ****")
      render :json => {:status => "ok"}, :status => 200
    else
      render(json: { status: "error", message: dcv.errors }, status: 500)
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
