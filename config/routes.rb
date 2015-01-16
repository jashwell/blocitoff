Blocitoff::Application.routes.draw do
  get "items/new"
  devise_for :users
  resources :lists do
    resources :items, only: [:new, :create]
  end
  
  get 'about' => 'welcome#about'
  root to: 'welcome#index'

end
