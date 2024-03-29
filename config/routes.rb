Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only:[:index, :create]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
