Rails.application.routes.draw do
  root 'articles#index'
  resources :articles, except: [:edit, :update, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
