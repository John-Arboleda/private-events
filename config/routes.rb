# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  root 'events#index'

  resources :users, only: %i[index show]
  resources :events
  resources :subscriptions, only: %i[create destroy]
end
