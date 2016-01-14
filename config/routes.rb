Rails.application.routes.draw do
  root 'home#index'
  resources :contracts, only: [:show, :new, :create]
  resources :clients, only: [:create, :index, :show, :new]
  resources :tools, only: [:index]
  resources :prices, only: [:index]
  resources :tools_groups, only: [:index, :new, :show, :create, :update, :edit]
end
