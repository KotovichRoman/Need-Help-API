Rails.application.routes.draw do
  resources :categories
  resources :users
  resources :requests

  post "/user", to: "users#find_user_by_email"
  post "/auth/login", to: "authentication#login"
  post "/auth", to: "authentication#authorize_request"
end
