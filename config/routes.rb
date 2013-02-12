SecretAdmirerApp::Application.routes.draw do

  root to: 'posts#index'

  resources :users do
    member do
      get "posts"
    end
  end

  resources :comments
  resources :posts
  resource :sessions
end
