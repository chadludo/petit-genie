Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resource :profiles, only: [:show]
  resources :categories, only: [:new, :create, :destroy]
  resources :lists
  resources :products, only: [:new, :edit]
end
