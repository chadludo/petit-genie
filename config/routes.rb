Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :lists do
    resources :categories do
      resources :products
    end
    resources :products
  end

  resource :profiles, only: [:show]
end
