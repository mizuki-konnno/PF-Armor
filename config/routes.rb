Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'cordes#index'

  get "/home/about/", to: "homes#about"

  get "/cordes/user_cordes", to:"cordes#user_cordes"

  resources :clothes, only: [:new, :create, :destroy, :index, :show]
  resources :genres, only: [:new, :create, :destroy, :index]
  resources :wish_lists, only: [:new, :create, :destroy, :index, :show]
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :cordes, only: [:new, :create, :destroy, :index, :show] do
    resource :favorites, only: [:create, :destroy]
  end
end
