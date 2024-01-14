Rails.application.routes.draw do
  get 'others/about'
  get '/about', to: 'others#about'
  get '/about/author', to: 'others#author'
end
