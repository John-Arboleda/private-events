Rails.application.routes.draw do
  devise_for :users
  
  root 'users#index'

  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :events
end
