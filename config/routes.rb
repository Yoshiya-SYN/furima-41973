Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :orders, only: [:index, :create]
  end
  root to: 'products#index'
  
end
