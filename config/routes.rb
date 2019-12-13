Rails.application.routes.draw do
  root "jobs#index"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :jobs
  resources :users
  resources :sessions
  #post "/jobusers/create", to: 'job_users#create', as:new_jobusers
  #get "/sessions", to: 'session#index', as: :sessions
  #post "/sessions", to: 'sessions#create', as: :sessions
  post "/sessions/new", to: 'sessions#new', as: :new_sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end