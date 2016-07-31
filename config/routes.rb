Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :devices, only: [:index, :show]
  resources :device_control_values, only: [:update]
end
