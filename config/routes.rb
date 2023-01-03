Rails.application.routes.draw do
  resources :responses
  resources :categories
  resources :users
  resources :requests

  get "/requests-active", to: "requests#index_active_requests"
  get "/my-requests", to: "requests#index_my_requests"

  post "/user", to: "users#find_user_by_email"
  post "/auth/login", to: "authentication#login"
  post "/auth", to: "authentication#authorize_request"
end
