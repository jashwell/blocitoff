Blocitoff::Application.routes.draw do
  devise_for :users
  resources :lists, except: [:index]
  
  get 'about' => 'welcome#about'
  root to: 'welcome#index'

end
