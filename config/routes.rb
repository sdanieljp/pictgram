Rails.application.routes.draw do
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics
  get 'comments/new?topic_id=:topic_id' => 'comments#create'
  resources :comments
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  post  '/favorites/destroy', to: 'favorites#destroy'
  
end