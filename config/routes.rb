Rails.application.routes.draw do
  devise_for :models
  root to: "movies#index"
  resources :users
  resources :movies, only: [:index, :show]
end
