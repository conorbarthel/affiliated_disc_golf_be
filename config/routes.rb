Rails.application.routes.draw do
  root to:'welcome#index'
  resources :discs, except: [:index, :show]
  resources :warehouses, only: [:show, :new, :create]
  resources :disc_warehouses, only: [:create]
end
