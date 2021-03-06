Rails.application.routes.draw do
  get 'comments/new'
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'
  
  resources :topics do
    resources :comments
  end

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
end