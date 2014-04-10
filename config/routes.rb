Kibble::Application.routes.draw do
  
  root to: 'home#index'
  
  resources :users
  resources :cases, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  
  #get "users/family_settings"
  
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
end
