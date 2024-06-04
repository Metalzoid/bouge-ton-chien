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
    resources :rides, only: %i[create]
  end
  resources :rides, only: %i[edit update show] do
    resources :reviews, only: %i[create]
  end
  resources :rewards, only: %i[index] do
    resources :user_rewards, only: %i[create index update]
  end
  resources :dogs
  get "/profil", to: "pages#profil", as: :profil
  get "/map", to: "pages#map", as: :map
end
