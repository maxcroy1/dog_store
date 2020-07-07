Rails.application.routes.draw do
  resources :orders, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :edit, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#home'
end
