Rails.application.routes.draw do
  root "tweets#index"
  resources :users

  resources :sessions, only: [:new, :destroy]
  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  post "authenticate" => "sessions#authenticate", as: "authenticate"

  resources :tweets, only: [:index, :create, :destroy]
end
