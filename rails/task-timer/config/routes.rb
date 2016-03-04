
Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'pages/directions'

  resources :tasks do
    resources :comments
    resources :timers
  end

  resources :projects
  resources :users

  root 'pages#home'
  
end
