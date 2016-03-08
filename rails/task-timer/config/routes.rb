
Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'

  get 'pages/about'

  get 'pages/directions'

  resources :tasks do
    resources :comments
    resources :timers
  end

  resources :projects

  root 'pages#home'
  
end
