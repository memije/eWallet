Rails.application.routes.draw do

  resources :user_cards
  resource :customers

  get 'session/new' => 'session#new', as: :session_new
  post 'session/new' => 'session#create', as: :session_create

  delete 'session' => 'session#destroy', as: :session_destroy

  get 'home/index' => 'home#index', as: :home
  root 'home#index'

end
