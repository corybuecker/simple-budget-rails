# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :login do
    get 'callback/new'
  end
  get 'login/new'
  get 'dashboard/index'

  root 'dashboard#index'
end
