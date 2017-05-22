Rails.application.routes.draw do
  devise_for :users
  root to: "movies#home"
  resources :users
  resources :movies, only: [:index, :show]
  resources :netflix
  resources :amazon
  resources :hulu
  resources :hbo
  get 'movies/index', to: 'movies#index'

  post 'movies/index', to: 'movies#searchAPI'

  post 'search', to: 'movies#searchAPI'
end
