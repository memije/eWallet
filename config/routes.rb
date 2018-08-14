Rails.application.routes.draw do
  get 'session/new' => 'session#new', as: :session_new
  post 'session/new' => 'session#create', as: :session_create
  get 'session/create'
  get 'session/destroy'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
