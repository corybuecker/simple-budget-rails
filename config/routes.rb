# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login/new'
  get 'dashboard/index'

  root 'dashboard#index'
end
