Rails.application.routes.draw do
  root "main#index"

  resource :session
  resource :registration
  resource :password_reset
  resource :password

  resources :articles

  resources :apps
  # Defines the root path route ("/")
  # root "posts#index"
end
