Rails.application.routes.draw do
  root "sessions#new"
  resources :users

  resources :sessions, only: [:new, :destroy]
  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  post "authenticate" => "sessions#authenticate", as: "authenticate"

  post '/follow/:user_id', to: 'follows#follow', as: 'follow'
  post '/unfollow/:follow_id', to: 'follows#unfollow', as: 'unfollow'

  post '/favorite/:tweet_id', to: 'favorites#favorite', as: 'favorite'
  post '/unfavorite/:favorite_id', to: 'favorites#unfavorite', as: 'unfavorite'

  resources :tweets, only: [:index, :create, :destroy]
end
