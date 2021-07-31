Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  get 'users/show'

  devise_for :users, controllers: { registrations: 'users/registrations' } 
  resources :users, :only => [:show]
 
  resources :fashions
end
