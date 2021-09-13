Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :homes, only:[:index]
  resources :books, only: [:new, :edit, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
end
