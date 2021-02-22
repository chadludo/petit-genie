Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resource :profiles, only: [:show]
  resources :lists
  resources :categories, only: [:new, :create, :destroy]
  resources :products, only: [:new, :create, :edit, :destroy]
end
