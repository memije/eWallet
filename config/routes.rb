Rails.application.routes.draw do

  root 'home#index'

  get 'home/index' => 'home#index', as: :home

  get 'session/new' => 'session#new', as: :session_new
  post 'session/new' => 'session#create', as: :session_create
  delete 'session' => 'session#destroy', as: :session_destroy

  resources :customer_wallets, except: [:show, :edit, :update]
  resources :transaction_histories, only: [:index, :new, :create]
  resources :cards, except: :show
  resources :customers, only: [:new, :create]

end
