Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users', to: 'users#index'
      get 'users/count', to: 'users#count'
      get 'users/:id', to: 'users#show'
      get 'users/:id/name', to: 'users#show_fullname'
      get 'users/:id/shops', to: 'shops#show_shops'
      post 'users/:id/shops', to: 'shops#create'
      post 'users', to: 'users#create'
      patch 'users/:id', to: 'users#update'
      delete 'users/:id', to: 'users#delete'
      get 'shops', to: 'shops#index'
      get 'shops/:id', to: 'shops#show'
      patch 'shops/:id', to: 'shops#update'
      delete 'shops/:id', to: 'shops#delete'

      get 'products', to: 'products#index'
      post 'products', to: 'products#create'

      get 'wish_list_items', to: 'wish_list_items#index'
      post 'wish_list_items', to: 'wish_list_items#create'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
