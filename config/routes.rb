Rails.application.routes.draw do
  
 
  root "movies#index"
  get "flops" => "movies#flops"
  resources :movies do
    resources :reviews
  end
  resources :users
  get "signup" => "users#new"

  resource :session, only: [ :new, :create, :destroy ]
  get "signin" => "sessions#new"


end
