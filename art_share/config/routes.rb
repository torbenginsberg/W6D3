Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  # resources :users
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  
  resources :artworks, only: [:show, :create, :update, :destroy] do
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

end
