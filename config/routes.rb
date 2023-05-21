Rails.application.routes.draw do
  devise_for :users
  mount Motor::Admin => '/motor_admin'
  resources :films
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "films#index"
  resources :films, except: :index
  resources :users, only: [:index]
end
