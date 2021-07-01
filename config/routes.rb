Rails.application.routes.draw do
  devise_for :users
  
  root 'events#index'

  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :events
  resources :subscriptions, only: [:create, :destroy]
end
