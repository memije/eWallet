Rails.application.routes.draw do

  resource :customers

  get 'session/new' => 'session#new', as: :session_new
  post 'session/new' => 'session#create', as: :session_create
  get 'session/create'
  get 'session/destroy'

  get 'home/index' => 'home#index', as: :home
  root 'home#index'

end
