Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  get 'users/show'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show' => "users#show"
 
  resources :fashions
end
