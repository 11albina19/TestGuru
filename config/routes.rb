# frozen_string_literal: true

Rails.application.routes.draw do
  root 'test#index'

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
      get :next_question
    end
  end
end
