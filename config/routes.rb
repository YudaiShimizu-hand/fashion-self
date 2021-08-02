Rails.application.routes.draw do

  root 'fashions#index'

  post 'posts/create' => 'posts#create', as: :post_create


  get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete

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
