Rails.application.routes.draw do
  root "users#new"
  resources :users

  get "log_out" => "sessions#destroy", as: "log_out"
  get "log_in" => "sessions#create", as: "log_in"
  resources :sessions
end
