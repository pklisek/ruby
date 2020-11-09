Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :articles do
    resources :comments
    resources :pictures
  end
  resources :admin
  resources :users
  root 'welcome#index'




end
