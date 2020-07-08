Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :users, only: [:create, :show, :edit, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#home'

  post '/items/:id', to: 'items#add_to_cart'

  get '/users/new', to: 'user#new', as: 'login'
  get '/users/:id/orders', to: 'user#orders'
  

  get '/checkout', to: 'checkout#user_select'
  post '/checkout', to: 'checkout#create_user'
  get '/checkout/billing_info', to: 'checkout#billing_info'
  post '/checkout/create_billing_info', to: 'checkout#create_billing_info'
  get '/checkout/shipping_info', to: 'checkout#shipping_info'
  post '/checkout/create_shipping_info', to: 'checkout#create_shipping_info'
  get '/checkout/preview_order', to: 'checkout#preview_order'
  post '/checkout/create_preview_order', to: 'checkout#create_preview_order'
  get '/checkout/payment', to: 'checkout#payment'
  post '/checkout/create_payment', to: 'checkout#create_payment'
  get '/checkout/confirmation', to: 'checkout#confirmation'
  post '/checkout/create_confirmation', to: 'checkout#create_confirmation'

end
