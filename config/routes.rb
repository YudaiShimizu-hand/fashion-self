Rails.application.routes.draw do
  root 'fashions#index'
  get 'pages/show'
  get 'users/show'

  devise_for :users, controllers: { registrations: 'users/registrations' } 
  resources :users do
    member do
      get :following, :followers, :following_fashions
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :fashions
  post   '/like/:fashion_id' => 'likes#like',   as: 'like'
  delete '/like/:fashion_id' => 'likes#unlike', as: 'unlike'
end
