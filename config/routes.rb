# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'test#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'
  
  resources :users, only: :create
  resources :sessions, only: [:create, :destroy]

  resources :tests do
    resources :questions, shallow: true, except: [:index] do
      resources :answers, shallow: true, except: [:index]
    end

    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :result #controller method name
    end
  end
end
