Rails.application.routes.draw do
  root to: "users#enter"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :recipes

  get "/dashboard", to: "users#dashboard", as: "dashboard"

  namespace :admin do
    get "/dashboard", to: "users#dashboard", as: "dashboard"
    resources :challenges, only: [:new, :create]
  end
end
