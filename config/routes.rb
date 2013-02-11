SecretAdmirerApp::Application.routes.draw do

  root to: 'static_pages#index'

  resources :users
  resources :comments
  resources :posts
  resource :sessions
end
