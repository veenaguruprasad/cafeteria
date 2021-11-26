Rails.application.routes.draw do
  get "/" => "home#index"
  resources :users
  resources :carts
  resources :orders
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :session
  delete "/signout" => "sessions#destroy", as: :destroy_session
  post "/order" => "carts#order"
end
