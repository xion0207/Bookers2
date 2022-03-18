Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 get "home/about" => "homes#about", as: "about"
 get "users" => "users#users"
 resources :books, only: [:new, :create, :index, :show, :destroy]
 resources :users, only: [:show, :edit, :update, :users]
end
