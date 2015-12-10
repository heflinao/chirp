Rails.application.routes.draw do
  root "sessions#new"
  resources :users

  resources :sessions, only: [:new, :destroy]
  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  post "authenticate" => "sessions#authenticate", as: "authenticate"

  post '/follow/:id', to: 'follows#follow', as: 'follow'
  post '/unfollow/:id', to: 'follows#unfollow', as: 'unfollow'

  resources :tweets, only: [:index, :create, :destroy]
end
