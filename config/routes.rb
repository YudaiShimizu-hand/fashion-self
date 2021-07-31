Rails.application.routes.draw do
  root 'pages#index'
  post 'posts/create', to: 'posts#create', as: :post_create
  get 'topics/index'
  get 'topics/show/:id', to: 'topics#show', as: :topics_show
  post 'topics/create', to: 'topics#create'
  delete 'topics/delete/:id', to: 'topics#delete', as: :topic_delete
  get 'users/show'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    member do
      get :following, :followers, :following_fashions
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :fashions

  post   '/like/:fashion_id', to: 'likes#like',   as: 'like'
  delete '/like/:fashion_id', to: 'likes#unlike', as: 'unlike'
end
