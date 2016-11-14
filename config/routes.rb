Rails.application.routes.draw do
  root 'articles#index'
  resources :articles, except: [:edit, :update, :destroy] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

end
