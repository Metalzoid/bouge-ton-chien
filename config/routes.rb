Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "courses#index"

  resources :courses, only: %i[show] do
    get "/navigate", to: "rides#navigate", as: "navigate"
    resources :rides, only: %i[create]
  end
  get "/map", to: "rides#map", as: "map"
  resources :rides, only: %i[edit update show] do
    resources :reviews, only: %i[create]
  end

  resources :users, only: [:show] do
    resources :dogs, only: %i[create index]
    resources :user_rewards, only: %i[index update]
  end

  resources :rewards, only: %i[index]
  resources :user_rewards, only: %i[create]
  resources :dogs, only: %i[destroy]
end
