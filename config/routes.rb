Rails.application.routes.draw do
  devise_for :users
  root "plans#index"
  resources :plans
  resources :users, only: [:edit, :update]
end
