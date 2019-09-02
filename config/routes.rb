# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  # admin
  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: 'users#index'
  end

  # static pages
  get '/privacy', to: 'pages#privacy'
  get '/terms', to: 'pages#terms'

  # resources
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  resources :products, only: %i[index show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#index'
end
