Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :edit, :update, :delete]
  resources :orders, only: [:new, :create, :show]
  resource :order_items, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#home'

  post '/items/:id', to: 'items#add_to_cart'
  post '/users/new', to: 'users#login'


  
end
