Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  get 'items/search'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only:[:index, :create]
    resources :comments, only: :create
  end
end
