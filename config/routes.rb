Rails.application.routes.draw do
  
  resources :users
  root "movies#index"
  get "flops" => "movies#flops"
  resources :movies do
    resources :reviews
  end


end
