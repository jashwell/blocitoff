Blocitoff::Application.routes.draw do
  get "items/new"
  devise_for :users
  resources :users, only: [:show]
  resources :lists do
    resources :items, only: [:new, :create, :destroy]
  end
  
  get 'about' => 'welcome#about'
  root to: 'welcome#index'

end
