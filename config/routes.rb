Rails.application.routes.draw do
  resources :categories
  resources :users
  resources :requests

  post "/auth/login", to: "authentication#login"
  post "/auth", to: "application#authorize_request"
end
