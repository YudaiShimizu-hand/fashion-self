Rails.application.routes.draw do
  root 'fashions#index'
  get 'pages/show'
  get 'users/show'

  devise_for :users, controllers: { registrations: 'users/registrations' } 
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :fashions
end
