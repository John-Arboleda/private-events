Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions'}
  
  root 'events#index'

  resources :users, only: [:index, :show]
  resources :events
  resources :subscriptions, only: [:create, :destroy]
end
