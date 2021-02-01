Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :lists
  resources :products
  resources :categories
end
