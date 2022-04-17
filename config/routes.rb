# frozen_string_literal: true

Rails.application.routes.draw do
  with_options except: [:show] do
    resources :accounts
    resources :goals
    resources :users
    resources :savings
  end

  get 'login/new'
  get 'login/callback/new'
  get 'dashboard/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dashboard#show'
end
