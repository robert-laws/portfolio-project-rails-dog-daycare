Rails.application.routes.draw do
  # root
  root 'static#home'

  # static pages
  get '/about', to: 'static#about', as: 'about'

  # sessions
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'new_user'
  delete '/signout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'

  # users
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    resources :addresses, only: [:show, :edit, :update]
    resources :dogs, only: [:show, :new, :create, :edit, :update]
    resources :reservations, only: [:show, :new, :create]
  end

  # addresses
  resources :addresses, only: [:update]

  # dogs
  resources :dogs, only: [:show, :create, :update, :destroy]

  # locations
  resources :locations, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :activities, only: [:index, :show]
  end

  # activities
  resources :activities, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # reservations
  resources :reservations, only: [:index]
end
