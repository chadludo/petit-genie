Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resource :profiles, only: [ :show ]

  resources :lists do
    resources :categories do
      resources :products, only: [ :show, :new, :create, :edit, :update ]
    end
    resources :products, only: [ :show, :new, :create, :edit, :update, :destroy ]
  end

end
