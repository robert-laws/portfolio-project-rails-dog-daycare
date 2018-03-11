Rails.application.routes.draw do
  get 'addresses/show'

  get 'addresses/edit'

  # root
  root 'static#home'

  # sessions
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'new_user'
  delete '/signout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'

  # users
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    resources :addresses, only: [:show, :edit]
  end

  resources :addresses, only: [:update]
end
