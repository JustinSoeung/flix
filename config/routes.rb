Rails.application.routes.draw do
  root "movies#index"

  resources :movies

  get "flops" => "movies#flops"
end
