Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    resource :gist, only: :create
    member do
      get :result
    end
  end

  namespace :admins do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
  end
end
