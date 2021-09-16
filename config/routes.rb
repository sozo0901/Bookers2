Rails.application.routes.draw do
  get 'home/about' => 'homes#about'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :edit, :create, :index, :show, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index, :new, :create]
end
