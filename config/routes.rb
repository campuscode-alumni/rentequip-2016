Rails.application.routes.draw do
  root 'home#index'
  resources :contracts, only: [:show, :new, :create] do
    member do
      get  'delivery_receipt'
      post 'delivery_receipt', to: 'contracts#create_delivery_receipt'
    end
    member do
      get  'devolution_receipt'
      post 'devolution_receipt', to: 'contracts#create_devolution_receipt'
    end
  end
  resources :clients, only: [:create, :index, :show, :new, :edit, :update]
  resources :tools, only: [:index]
  resources :prices, only: [:create, :index, :show, :new]
  resources :tools_groups
end
