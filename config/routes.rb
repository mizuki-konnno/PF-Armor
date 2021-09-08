Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'cordes#index'

  get "/home/about/", to: "homes#about"

  resources :clothes, only: [:new, :create, :destroy, :index, :show]
  resources :genres, only: [:new, :create, :destroy, :index]
  resources :cordes, only: [:new, :create, :destroy, :index, :show]
  resources :wish_lists, only: [:new, :create, :destroy, :index, :show]
  resources :users, only: [:index, :show, :edit, :update]
end
