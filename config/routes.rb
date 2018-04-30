Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  
  post "salons/search" => "salons#search"
  # get "salons/search"

  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :users, except: [:new, :create, :show] do
    # resources :reviews
  end

  get "/signup" => "users#new"
  post "/users" => "users#create" 
  get "/profile" => "users#profile"


  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # get 'auth/failure', to: redirect('/')
  get "/auth/facebook" => "sessions#create_from_omniauth"

  resources :salons



  

end
