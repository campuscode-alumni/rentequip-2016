Rails.application.routes.draw do
  root 'home#index'
  resources :contracts, only: [:show, :new, :create]
  resources :clients, only: [:create, :index, :show, :new, :edit, :update]
  resources :tools, only: [:index]
  resources :prices, only: [:index]
end
