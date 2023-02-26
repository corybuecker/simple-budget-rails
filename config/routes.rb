# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :login do
    get 'callback/new'
  end
  get 'login/new'
  get 'dashboard', to: 'dashboard#show'

  root 'dashboard#index'
end
