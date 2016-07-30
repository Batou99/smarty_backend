Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :devices, only: [:index, :show, :update]
end
