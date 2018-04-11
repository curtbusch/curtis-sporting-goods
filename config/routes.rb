Rails.application.routes.draw do
  get 'charges/new'

  get 'charges/create'

  resources :products, only: [:index, :show] do

    member do
      post :add_to_cart
    end
  end


  root to: 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
