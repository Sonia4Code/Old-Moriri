Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  # delete "/logout" => "sessions#destroy", as: "logout"
  # resources :users, only: [:new, :create]
  # resources :sessions, only: [:create]


end
