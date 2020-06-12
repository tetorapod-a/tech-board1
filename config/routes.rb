Rails.application.routes.draw do
  devise_for :users
  root "plans#index"
  resources :plans do
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
    get "plans/all" => "plans#all"

  end
  resources :users, only: [:edit, :update, :show]
end

