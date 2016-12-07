Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/auth/github/callback', to: 'sessions#create'
  get '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:show]
  resources :repos, only: [:index]
  resources :stars, only: [:index]
  resources :followers, only: [:index]
  resources :following, only: [:index]
end
