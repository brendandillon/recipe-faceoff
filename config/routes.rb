Rails.application.routes.draw do
  root to: "users#enter"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  get "/dashboard", to: "users#dashboard", as: "dashboard"
end
