Rails.application.routes.draw do
  devise_for :users
  root to: "movies#home"
  resources :users
  resources :movies, only: [:index, :show]
  resources :groups do
    resources :discussions, only: [:new, :edit, :update]
  end
  resources :netflix, only: [:index]
  resources :amazon, only: [:index]
  resources :hulu, only: [:index]
  resources :hbo, only: [:index]
  get 'movies/index', to: 'movies#index'

  post 'movies/index', to: 'movies#searchAPI'

  post 'search', to: 'movies#searchAPI'

  namespace :api do
    namespace :v1 do
      resources :groups, only: [:show]
      resources :discussions, only: [:create]
    end
  end
end
