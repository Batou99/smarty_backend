class DevicesController < ApplicationController

  respond_to :json

  def index
    render json: Device.all, fields: [:id, :name, :type]
  end

  def show
    device = Device.find(params[:id])
    if device
      render json: device
    else
      render(:json => {:status => "error", :message => "Device not found"}, :status => 404)
    end
  end

  def update
  end
end
