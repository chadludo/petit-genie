Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resource :profiles, only: [:show]
  resources :products, only: [:edit, :update, :destroy]

  resources :lists do
    resources :categories, only: [:new, :create, :destroy]
    resources :products, only: [:new, :create]
  end

  resources :categories do
    resources :products, only: [:new, :create, :edit]
  end
end
