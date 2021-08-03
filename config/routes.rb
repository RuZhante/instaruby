Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show, :edit, :update] do
    resources :posts
    resources :followers, only: :index
    resources :followings, only: :index
    resources :follows, only: :create
    resources :feed_posts, only: :index
  end
  root to: 'users#home'
end
