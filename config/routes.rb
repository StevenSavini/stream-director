Rails.application.routes.draw do
  devise_for :users
  root to: "movies#home"
  resources :users
  resources :movies, only: [:index, :show]
end
