Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

end
