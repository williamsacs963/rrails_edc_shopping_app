Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :my_shopping_cart, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

  devise_for :users

  root 'home#index'
  
  get 'home/administrador'
  get 'home/reputation'
  get 'home/purchases'
  get 'home/favorites'
  get 'home/products'
  get 'home/history'
  get 'home/summary'
  get 'home/search'
  get 'home/sales'
  get 'home/cart'
  get "add/:product_id",as: :add_to_cart, to: "my_shopping_carts#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
