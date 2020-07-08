Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :users, only: [:create, :show, :edit, :update, :delete]
  resources :orders, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#home'

  post '/items/:id', to: 'items#add_to_cart'

  get '/users/new', to: 'user#new', as: 'login'
  
end
