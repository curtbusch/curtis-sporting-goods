Rails.application.routes.draw do

  get 'pages/show'

  get 'orders/new'

  get 'addresses/new'

  get 'address/new'

  get 'charges/new'

  get 'charges/create'

  resources :products, only: [:index, :show] do

    member do
      post :add_to_cart
    end
  end

  resources :charges, only: [:new, :create]
  resources :address, only: [:new]
  resources :orders, only: [:new]

  post 'address/add_to_db'
  root to: 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
