Rails.application.routes.draw do
  root "sessions#new"
  resources :sessions, only: [:new, :destroy]
  resources :users
  resources :tweets, only: [:index, :create, :destroy]

  # post "" => "sessions#authenticate", as: "authenticate"

  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  post "authenticate" => "sessions#authenticate", as: "authenticate"

  post '/follow/:user_id', to: 'follows#create', as: 'follow'
  delete '/unfollow/:id', to: 'follows#destroy', as: 'unfollow'

  post '/favorite/:tweet_id', to: 'favorites#create', as: 'favorite'
  delete '/unfavorite/:id', to: 'favorites#destroy', as: 'unfavorite'
end
