Rails.application.routes.draw do
  resources :tools, only: [:index]
  resources :clients, only: [:create, :index, :show]
  resources :prices, only: [:index]
end
