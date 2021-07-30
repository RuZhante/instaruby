Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show, :edit, :update] do
    resources :posts
  end
  root to: 'users#home'
end
