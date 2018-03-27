Rails.application.routes.draw do
  get 'products', to: 'products#index', as: 'products'

  get 'products/:id', to: 'products#show', as: 'product', id: /\d+/

  root to: 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
