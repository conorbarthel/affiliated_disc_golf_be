Rails.application.routes.draw do
  root to:'welcome#index'
  resources :discs, except: [:index, :show]
end
