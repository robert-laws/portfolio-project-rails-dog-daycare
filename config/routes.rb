Rails.application.routes.draw do
  # root
  root 'static#home'

  # sessions
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'new_user'
  get '/signout', to: 'sessions#destroy'

  # users
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
end
