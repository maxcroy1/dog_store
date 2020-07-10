Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  resources :orders, only: [:new, :create, :show]
  resources :order_items, only: [:index, :new, :create, :delete]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'

  post '/items/:id', to: 'items#add_to_cart'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  get '/logout', to: "sessions#destroy"

  get '/order_items/clear', to: 'order_items#clear_cart'
  
end
