# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :login do
    get 'callback/new'
  end
  get 'login/new'

  get 'reports', to: 'reports#show'

  resources :accounts
  resources :goals
  resources :savings
  namespace :user do
    resource :preferences, only: [:update]
  end

  root 'reports#show'
end
