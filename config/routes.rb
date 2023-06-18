Rails.application.routes.draw do
  devise_for :users
  mount Motor::Admin => '/motor_admin'

  resources :films, only: [:index, :update]

  resources :films do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :reviews, only: [:show, :edit, :update, :destroy]

  root to: "films#index"
  resources :users, only: [:index]
end
