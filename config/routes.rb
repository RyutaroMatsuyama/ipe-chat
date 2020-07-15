Rails.application.routes.draw do
  root 'messages#index'
  resources :messages

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'

  get '/signup', to: 'sessions#signup'
  post '/signup', to: 'sessions#create'

  get '/logout', to: 'sessions#logout'


  namespace :api do
    get '/messages', to: 'messages#index', defaults: { format: 'json' }
  end
end
